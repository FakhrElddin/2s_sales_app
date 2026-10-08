// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsEntityAdapter extends TypeAdapter<OrderDetailsEntity> {
  @override
  final int typeId = 2;

  @override
  OrderDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsEntity(
      id: fields[0] as int,
      productName: fields[1] as String,
      quantity: fields[2] as double,
      priceUnit: fields[3] as double,
      priceSubtotal: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.priceUnit)
      ..writeByte(4)
      ..write(obj.priceSubtotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
