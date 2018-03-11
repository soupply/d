/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from pocket100
 */
module soupply.pocket100.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength;

import soupply.util : Vector;

import soupply.pocket100.packet : Pocket100Packet;
static import soupply.pocket100.types;

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

class MetadataValue : Pocket100Packet
{

    @Var uint id;
    @Var uint type;

    this(uint id, uint type) pure nothrow @safe @nogc
    {
        this.id = id;
        this.type = type;
    }

    mixin Make;

}

class MetadataValue0 : MetadataValue
{

    byte value;

    this(uint id, byte value) pure nothrow @safe @nogc
    {
        super(id, 0);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue1 : MetadataValue
{

    @LittleEndian short value;

    this(uint id, short value) pure nothrow @safe @nogc
    {
        super(id, 1);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue2 : MetadataValue
{

    @Var int value;

    this(uint id, int value) pure nothrow @safe @nogc
    {
        super(id, 2);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue3 : MetadataValue
{

    float value;

    this(uint id, float value) pure nothrow @safe @nogc
    {
        super(id, 3);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue4 : MetadataValue
{

    string value;

    this(uint id, string value) pure nothrow @safe @nogc
    {
        super(id, 4);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue5 : MetadataValue
{

    soupply.pocket100.types.Slot value;

    this(uint id, soupply.pocket100.types.Slot value) pure nothrow @safe @nogc
    {
        super(id, 5);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue6 : MetadataValue
{

    @Var Vector!(int, "xyz") value;

    this(uint id, Vector!(int, "xyz") value) pure nothrow @safe @nogc
    {
        super(id, 6);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue7 : MetadataValue
{

    @Var long value;

    this(uint id, long value) pure nothrow @safe @nogc
    {
        super(id, 7);
        this.value = value;
    }

    mixin Make;

}

class MetadataValue8 : MetadataValue
{

    Vector!(float, "xyz") value;

    this(uint id, Vector!(float, "xyz") value) pure nothrow @safe @nogc
    {
        super(id, 8);
        this.value = value;
    }

    mixin Make;

}

struct Metadata
{

    private MetadataValue[uint] _store;
    private bool _cached = false;
    private ubyte[] _cache;

    void encodeBody(InputBuffer buffer)
    {
        if(!_cached)
        {
            InputBuffer _buffer = new InputBuffer();
            writeLength!(EndianType.var, uint)(_buffer, _store.length);
            foreach(value ; _store) value.encodeBody(_buffer);
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
