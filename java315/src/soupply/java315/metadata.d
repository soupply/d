/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from java315
 */
module soupply.java315.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength, writeImpl, readLength, readImpl;
import packetmaker.memory : malloc, realloc, alloc, free;

import soupply.util : Vector;
import soupply.java315.packet : Java315Packet;

static import soupply.java315.types;

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
}

class MetadataValue : Java315Packet
{

    @EncodeOnly ubyte type;

    this(ubyte type) pure nothrow @safe @nogc
    {
        this.type = type;
    }

    mixin Make;

}

class MetadataValue0 : MetadataValue
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

class MetadataValue1 : MetadataValue
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

class MetadataValue2 : MetadataValue
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

class MetadataValue3 : MetadataValue
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

class MetadataValue4 : MetadataValue
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

class MetadataValue5 : MetadataValue
{

    soupply.java315.types.Slot value;

    this() pure nothrow @safe @nogc
    {
        super(5);
    }

    this(soupply.java315.types.Slot value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue6 : MetadataValue
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

class MetadataValue7 : MetadataValue
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

class MetadataValue8 : MetadataValue
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

class MetadataValue9 : MetadataValue
{

    soupply.java315.types.OptionalPosition value;

    this() pure nothrow @safe @nogc
    {
        super(9);
    }

    this(soupply.java315.types.OptionalPosition value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue10 : MetadataValue
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

class MetadataValue11 : MetadataValue
{

    soupply.java315.types.OptionalUuid value;

    this() pure nothrow @safe @nogc
    {
        super(11);
    }

    this(soupply.java315.types.OptionalUuid value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue12 : MetadataValue
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

struct Metadata
{

    MetadataValue[ubyte] values;

    void encodeBody(InputBuffer buffer) @nogc
    {
        foreach(id, value; values)
        {
            writeImpl!(EndianType.bigEndian, ubyte)(buffer, id);
            value.encodeBody(buffer);
        }
        buffer.writeUnsignedByte(ubyte(255));
    }

    void decodeBody(OutputBuffer buffer)
    {
        ubyte id;
        while((id = readImpl!(EndianType.bigEndian, ubyte)(buffer)) != 255)
        {
            switch(readImpl!(EndianType.bigEndian, ubyte)(buffer))
            {
                case 0:
                    auto value = new MetadataValue0();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 1:
                    auto value = new MetadataValue1();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 2:
                    auto value = new MetadataValue2();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 3:
                    auto value = new MetadataValue3();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 4:
                    auto value = new MetadataValue4();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 5:
                    auto value = new MetadataValue5();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 6:
                    auto value = new MetadataValue6();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 7:
                    auto value = new MetadataValue7();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 8:
                    auto value = new MetadataValue8();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 9:
                    auto value = new MetadataValue9();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 10:
                    auto value = new MetadataValue10();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 11:
                    auto value = new MetadataValue11();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 12:
                    auto value = new MetadataValue12();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                default: throw new Exception("Unknown metadata type");
            }
        }
    }

}
