/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from data/java210.xml
 */
module soupply.java210.types;

static import std.conv;
import packetmaker;
import packetmaker.maker : EndianType, writeLength, readLength;

import soupply.util : Vector, UUID;
import soupply.java210.metadata;

struct Statistic
{

    enum string[] __fields = ["name", "value"];

    string name;
    @Var uint value;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Statistic(name: " ~ std.conv.to!string(this.name) ~ ", value: " ~ std.conv.to!string(this.value) ~ ")";
    }

}

struct BlockChange
{

    enum string[] __fields = ["xz", "y", "block"];

    ubyte xz;
    ubyte y;
    @Var uint block;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "BlockChange(xz: " ~ std.conv.to!string(this.xz) ~ ", y: " ~ std.conv.to!string(this.y) ~ ", block: " ~ std.conv.to!string(this.block) ~ ")";
    }

}

struct Slot
{

    enum string[] __fields = ["id", "count", "damage", "nbt"];

    short id;
    @Condition("id>0") ubyte count;
    @Condition("id>0") ushort damage;
    @Condition("id>0") @Bytes ubyte[] nbt;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Slot(id: " ~ std.conv.to!string(this.id) ~ ", count: " ~ std.conv.to!string(this.count) ~ ", damage: " ~ std.conv.to!string(this.damage) ~ ", nbt: " ~ std.conv.to!string(this.nbt) ~ ")";
    }

}

struct Icon
{

    // direction and type
    enum ubyte WHITE_ARROW = 0;
    enum ubyte GREEN_ARROW = 1;
    enum ubyte RED_ARROW = 2;
    enum ubyte BLUE_ARROW = 3;
    enum ubyte WHITE_CROSS = 4;
    enum ubyte RED_POINTER = 5;
    enum ubyte WHITE_CIRCLE = 6;

    enum string[] __fields = ["directionAndType", "position"];

    ubyte directionAndType;
    Vector!(ubyte, "xz") position;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Icon(directionAndType: " ~ std.conv.to!string(this.directionAndType) ~ ", position: " ~ std.conv.to!string(this.position) ~ ")";
    }

}

struct Property
{

    enum string[] __fields = ["name", "value", "signed", "signature"];

    string name;
    string value;
    bool signed;
    @Condition("signed==true") string signature;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Property(name: " ~ std.conv.to!string(this.name) ~ ", value: " ~ std.conv.to!string(this.value) ~ ", signed: " ~ std.conv.to!string(this.signed) ~ ", signature: " ~ std.conv.to!string(this.signature) ~ ")";
    }

}

struct ListAddPlayer
{

    // gamemode
    enum uint SURVIVAL = 0;
    enum uint CREATIVE = 1;
    enum uint ADVENTURE = 2;
    enum uint SPECTATOR = 3;

    enum string[] __fields = ["uuid", "name", "properties", "gamemode", "latency", "hasDisplayName", "displayName"];

    UUID uuid;
    string name;
    soupply.java210.types.Property[] properties;
    @Var uint gamemode;
    @Var uint latency;
    bool hasDisplayName;
    @Condition("hasDisplayName==true") string displayName;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "ListAddPlayer(uuid: " ~ std.conv.to!string(this.uuid) ~ ", name: " ~ std.conv.to!string(this.name) ~ ", properties: " ~ std.conv.to!string(this.properties) ~ ", gamemode: " ~ std.conv.to!string(this.gamemode) ~ ", latency: " ~ std.conv.to!string(this.latency) ~ ", hasDisplayName: " ~ std.conv.to!string(this.hasDisplayName) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ")";
    }

}

struct ListUpdateGamemode
{

    // gamemode
    enum uint SURVIVAL = 0;
    enum uint CREATIVE = 1;
    enum uint ADVENTURE = 2;
    enum uint SPECTATOR = 3;

    enum string[] __fields = ["uuid", "gamemode"];

    UUID uuid;
    @Var uint gamemode;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "ListUpdateGamemode(uuid: " ~ std.conv.to!string(this.uuid) ~ ", gamemode: " ~ std.conv.to!string(this.gamemode) ~ ")";
    }

}

struct ListUpdateLatency
{

    enum string[] __fields = ["uuid", "latency"];

    UUID uuid;
    @Var uint latency;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "ListUpdateLatency(uuid: " ~ std.conv.to!string(this.uuid) ~ ", latency: " ~ std.conv.to!string(this.latency) ~ ")";
    }

}

struct ListUpdateDisplayName
{

    enum string[] __fields = ["uuid", "hasDisplayName", "displayName"];

    UUID uuid;
    bool hasDisplayName;
    @Condition("hasDisplayName==true") string displayName;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "ListUpdateDisplayName(uuid: " ~ std.conv.to!string(this.uuid) ~ ", hasDisplayName: " ~ std.conv.to!string(this.hasDisplayName) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ")";
    }

}

struct Modifier
{

    // operation
    enum ubyte ADD_SUBSTRACT_AMOUNT = 0;
    enum ubyte ADD_SUBSTRACT_AMOUNT_PERCENTAGE = 1;
    enum ubyte MULTIPLY_AMOUNT_PERCENTAGE = 2;

    enum string[] __fields = ["uuid", "amount", "operation"];

    UUID uuid;
    double amount;
    ubyte operation;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Modifier(uuid: " ~ std.conv.to!string(this.uuid) ~ ", amount: " ~ std.conv.to!string(this.amount) ~ ", operation: " ~ std.conv.to!string(this.operation) ~ ")";
    }

}

struct Attribute
{

    enum string[] __fields = ["key", "value", "modifiers"];

    string key;
    double value;
    soupply.java210.types.Modifier[] modifiers;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "Attribute(key: " ~ std.conv.to!string(this.key) ~ ", value: " ~ std.conv.to!string(this.value) ~ ", modifiers: " ~ std.conv.to!string(this.modifiers) ~ ")";
    }

}

struct OptionalPosition
{

    enum string[] __fields = ["hasPosition", "position"];

    bool hasPosition;
    @Condition("hasPosition==true") ulong position;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "OptionalPosition(hasPosition: " ~ std.conv.to!string(this.hasPosition) ~ ", position: " ~ std.conv.to!string(this.position) ~ ")";
    }

}

struct OptionalUuid
{

    enum string[] __fields = ["hasUuid", "uuid"];

    bool hasUuid;
    UUID uuid;

    mixin Make!(Endian.bigEndian, varuint);
    string toString()
    {
        return "OptionalUuid(hasUuid: " ~ std.conv.to!string(this.hasUuid) ~ ", uuid: " ~ std.conv.to!string(this.uuid) ~ ")";
    }

}
