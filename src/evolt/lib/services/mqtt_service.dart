// import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart' as mqtt;

class MQTTService {
  late mqtt.MqttServerClient client;
  late mqtt.MqttConnectionState connectionState;

  void connect(int idUser) async {
    // Specify a unique client identifier
    client = mqtt.MqttServerClient.withPort(
        '34.101.227.125', idUser.toString(), 1883);

    client.logging(on: true); // Enable logging for more detailed error messages

    // Set the keep-alive period
    client.keepAlivePeriod = 20;

    // Set the correct protocol version if necessary
    client.setProtocolV311();

    // Set any required credentials
    client.connectionMessage = mqtt.MqttConnectMessage()
        .withClientIdentifier(idUser.toString())
        .startClean(); // Use a clean session

    try {
      await client.connect();
    } catch (e) {
      // debugPrint('Exception: $e');
      client.disconnect();
      return;
    }

    // Check connection state
    if (client.connectionStatus!.state == mqtt.MqttConnectionState.connected) {
      // debugPrint('Connected successfully');
    } else {
      // debugPrint('Failed to connect, status is ${client.connectionStatus}');
      client.disconnect();
      return;
    }

    client.updates!
        .listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>> c) {
      // final mqtt.MqttPublishMessage message =
      //     c[0].payload as mqtt.MqttPublishMessage;
      // final payload = mqtt.MqttPublishPayload.bytesToStringAsString(
      //     message.payload.message);

      // debugPrint('Received message: $payload from topic: ${c[0].topic}>');
    });
  }

  void publish(String topic, String message) {
    final builder = mqtt.MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, mqtt.MqttQos.exactlyOnce, builder.payload!);
  }
}
