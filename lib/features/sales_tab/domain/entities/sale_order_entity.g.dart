// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleOrderEntityAdapter extends TypeAdapter<SaleOrderEntity> {
  @override
  final int typeId = 1;

  @override
  SaleOrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleOrderEntity(
      id: fields[0] as int,
      orderNumber: fields[1] as String,
      customerName: fields[2] as String,
      date: fields[3] as String,
      status: fields[4] as String,
      amountTotal: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SaleOrderEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderNumber)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.amountTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleOrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
