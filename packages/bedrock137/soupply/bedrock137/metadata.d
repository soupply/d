/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from bedrock137
 */
module soupply.bedrock137.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength, writeImpl, readLength, readImpl;

import xbuffer.memory : malloc, realloc, alloc, free;

import soupply.util : Vector;

static import soupply.bedrock137.types;

enum MetadataType : uint
{
    BYTE = 0,
    SHORT = 1,
    INT = 2,
    FLOAT = 3,
    STRING = 4,
    SLOT = 5,
    BLOCK_POSITION = 6,
    LONG = 7,
    ENTITY_POSITION = 8,
}

class MetadataValue : PacketImpl!(Endian.littleEndian, varuint, varuint)
{

    @Var @EncodeOnly uint type;

    this(uint type) pure nothrow @safe @nogc
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

    short value;

    this() pure nothrow @safe @nogc
    {
        super(1);
    }

    this(short value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue2 : MetadataValue
{

    @Var int value;

    this() pure nothrow @safe @nogc
    {
        super(2);
    }

    this(int value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue3 : MetadataValue
{

    float value;

    this() pure nothrow @safe @nogc
    {
        super(3);
    }

    this(float value) pure nothrow @safe @nogc
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

    soupply.bedrock137.types.Slot value;

    this() pure nothrow @safe @nogc
    {
        super(5);
    }

    this(soupply.bedrock137.types.Slot value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue6 : MetadataValue
{

    @Var Vector!(int, "xyz") value;

    this() pure nothrow @safe @nogc
    {
        super(6);
    }

    this(Vector!(int, "xyz") value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue7 : MetadataValue
{

    @Var long value;

    this() pure nothrow @safe @nogc
    {
        super(7);
    }

    this(long value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataValue8 : MetadataValue
{

    Vector!(float, "xyz") value;

    this() pure nothrow @safe @nogc
    {
        super(8);
    }

    this(Vector!(float, "xyz") value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

struct Metadata
{

    MetadataValue[uint] values;

    void encodeBody(Buffer buffer) @nogc
    {
        writeLength!(EndianType.var, uint)(buffer, values.length);
        foreach(id, value; values)
        {
            writeImpl!(EndianType.var, uint)(buffer, id);
            value.encodeBody(buffer);
        }
    }

    void decodeBody(Buffer buffer)
    {
        foreach(i ; 0..readLength!(EndianType.var, uint)(buffer))
        {
            uint id = readImpl!(EndianType.var, uint)(buffer);
            switch(readImpl!(EndianType.var, uint)(buffer))
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
                default: throw new Exception("Unknown metadata type");
            }
        }
    }

}
