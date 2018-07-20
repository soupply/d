/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from java393
 */
module soupply.java393.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength, writeImpl, readLength, readImpl;

import soupply.util;

static import soupply.java393.types;

enum MetadataType : ubyte
{
    BYTE = 0,
    INT = 1,
    FLOAT = 2,
    STRING = 3,
    CHAT = 4,
    SLOT = 5,
    BOOL = 6,
    ROTATION = 7,
    POSITION = 8,
    OPTIONAL_POSITION = 9,
    DIRECTION = 10,
    UUID = 11,
    BLOCK = 12,
    NBT = 13,
}

class MetadataValue : PacketImpl!(Endian.bigEndian, varuint, varuint)
{

    @EncodeOnly ubyte type;

    this(ubyte type) pure nothrow @safe @nogc
    {
        this.type = type;
    }

    mixin Make;

}

class MetadataByte : MetadataValue
{

    byte value;

    this() pure nothrow @safe @nogc
    {
        super(0);
    }

    this(byte value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataInt : MetadataValue
{

    @Var uint value;

    this() pure nothrow @safe @nogc
    {
        super(1);
    }

    this(uint value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataFloat : MetadataValue
{

    float value;

    this() pure nothrow @safe @nogc
    {
        super(2);
    }

    this(float value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataString : MetadataValue
{

    string value;

    this() pure nothrow @safe @nogc
    {
        super(3);
    }

    this(string value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataChat : MetadataValue
{

    string value;

    this() pure nothrow @safe @nogc
    {
        super(4);
    }

    this(string value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataSlot : MetadataValue
{

    soupply.java393.types.Slot value;

    this() pure nothrow @safe @nogc
    {
        super(5);
    }

    this(soupply.java393.types.Slot value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataBool : MetadataValue
{

    bool value;

    this() pure nothrow @safe @nogc
    {
        super(6);
    }

    this(bool value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataRotation : MetadataValue
{

    Vector!(float, "xyz") value;

    this() pure nothrow @safe @nogc
    {
        super(7);
    }

    this(Vector!(float, "xyz") value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataPosition : MetadataValue
{

    ulong value;

    this() pure nothrow @safe @nogc
    {
        super(8);
    }

    this(ulong value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataOptionalPosition : MetadataValue
{

    soupply.java393.types.OptionalPosition value;

    this() pure nothrow @safe @nogc
    {
        super(9);
    }

    this(soupply.java393.types.OptionalPosition value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataDirection : MetadataValue
{

    @Var uint value;

    this() pure nothrow @safe @nogc
    {
        super(10);
    }

    this(uint value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataUuid : MetadataValue
{

    soupply.java393.types.OptionalUuid value;

    this() pure nothrow @safe @nogc
    {
        super(11);
    }

    this(soupply.java393.types.OptionalUuid value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataBlock : MetadataValue
{

    @Var uint value;

    this() pure nothrow @safe @nogc
    {
        super(12);
    }

    this(uint value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataNbt : MetadataValue
{

    @Bytes ubyte[] value;

    this() pure nothrow @safe @nogc
    {
        super(13);
    }

    this(ubyte[] value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

struct Metadata
{

    MetadataValue[ubyte] values;

    void encodeBody(Buffer buffer)
    {
        foreach(id, value; values)
        {
            writeImpl!(EndianType.bigEndian, ubyte)(buffer, id);
            value.encodeBody(buffer);
        }
        buffer.write(ubyte(255));
    }

    void decodeBody(Buffer buffer)
    {
        ubyte id;
        while((id = buffer.read!ubyte()) != 255)
        {
            switch(readImpl!(EndianType.bigEndian, ubyte)(buffer))
            {
                case 0:
                    auto value = new MetadataByte();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 1:
                    auto value = new MetadataInt();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 2:
                    auto value = new MetadataFloat();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 3:
                    auto value = new MetadataString();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 4:
                    auto value = new MetadataChat();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 5:
                    auto value = new MetadataSlot();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 6:
                    auto value = new MetadataBool();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 7:
                    auto value = new MetadataRotation();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 8:
                    auto value = new MetadataPosition();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 9:
                    auto value = new MetadataOptionalPosition();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 10:
                    auto value = new MetadataDirection();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 11:
                    auto value = new MetadataUuid();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 12:
                    auto value = new MetadataBlock();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 13:
                    auto value = new MetadataNbt();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                default: throw new Exception("Unknown metadata type");
            }
        }
    }

}
