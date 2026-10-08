// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerEntityAdapter extends TypeAdapter<CustomerEntity> {
  @override
  final int typeId = 0;

  @override
  CustomerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      city: fields[3] as String?,
      email: fields[4] as String?,
      street: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.street);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
