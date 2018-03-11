/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from java340
 */
module soupply.java340.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength;

import soupply.util : Vector;

import soupply.java340.packet : Java340Packet;
static import soupply.java340.types;

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

class MetadataValue : Java340Packet
{

    ubyte id;
    ubyte type;

    this(ubyte id, ubyte type) pure nothrow @safe @nogc
    {
        this.id = id;
        this.type = type;
    }

    mixin Make;

}

class MetadataValue0 : MetadataValue
{

    byte value;

    this(ubyte id, byte value) pure nothrow @safe @nogc
    {
        super(id, 0);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue1 : MetadataValue
{

    @Var uint value;

    this(ubyte id, uint value) pure nothrow @safe @nogc
    {
        super(id, 1);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue2 : MetadataValue
{

    float value;

    this(ubyte id, float value) pure nothrow @safe @nogc
    {
        super(id, 2);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue3 : MetadataValue
{

    string value;

    this(ubyte id, string value) pure nothrow @safe @nogc
    {
        super(id, 3);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue4 : MetadataValue
{

    string value;

    this(ubyte id, string value) pure nothrow @safe @nogc
    {
        super(id, 4);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue5 : MetadataValue
{

    soupply.java340.types.Slot value;

    this(ubyte id, soupply.java340.types.Slot value) pure nothrow @safe @nogc
    {
        super(id, 5);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue6 : MetadataValue
{

    bool value;

    this(ubyte id, bool value) pure nothrow @safe @nogc
    {
        super(id, 6);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue7 : MetadataValue
{

    Vector!(float, "xyz") value;

    this(ubyte id, Vector!(float, "xyz") value) pure nothrow @safe @nogc
    {
        super(id, 7);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue8 : MetadataValue
{

    ulong value;

    this(ubyte id, ulong value) pure nothrow @safe @nogc
    {
        super(id, 8);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue9 : MetadataValue
{

    soupply.java340.types.OptionalPosition value;

    this(ubyte id, soupply.java340.types.OptionalPosition value) pure nothrow @safe @nogc
    {
        super(id, 9);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue10 : MetadataValue
{

    @Var uint value;

    this(ubyte id, uint value) pure nothrow @safe @nogc
    {
        super(id, 10);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue11 : MetadataValue
{

    soupply.java340.types.OptionalUuid value;

    this(ubyte id, soupply.java340.types.OptionalUuid value) pure nothrow @safe @nogc
    {
        super(id, 11);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue12 : MetadataValue
{

    @Var uint value;

    this(ubyte id, uint value) pure nothrow @safe @nogc
    {
        super(id, 12);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue13 : MetadataValue
{

    @Bytes ubyte[] value;

    this(ubyte id, ubyte[] value) pure nothrow @safe @nogc
    {
        super(id, 13);
        this.value = value;
    }

    mixin Make;

}

struct Metadata
{

    private MetadataValue[ubyte] _store;
    private bool _cached = false;
    private ubyte[] _cache;

    void encodeBody(InputBuffer buffer)
    {
        if(!_cached)
        {
            InputBuffer _buffer = new InputBuffer();
            foreach(value ; _store) value.encodeBody(_buffer);
            _buffer.writeUnsignedByte(ubyte(255));
            _cached = true;
            _cache = _buffer.data;
        }
        buffer.writeBytes(_cache);
    }

    void decodeBody(OutputBuffer buffer)
    {
        assert(0, `Cannot decode Metadata`);
    }

}
