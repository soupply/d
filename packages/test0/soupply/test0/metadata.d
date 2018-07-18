/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from test0
 */
module soupply.test0.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength, writeImpl, readLength, readImpl;

import soupply.util;

static import soupply.test0.types;

enum MetadataType : uint
{
    BYTE = 0,
}

class MetadataValue : PacketImpl!(Endian.bigEndian, ubyte, varuint)
{

    @Var @EncodeOnly uint type;

    this(uint type) pure nothrow @safe @nogc
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

struct Metadata
{

    MetadataValue[uint] values;

    void encodeBody(Buffer buffer)
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
                    auto value = new MetadataByte();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                default: throw new Exception("Unknown metadata type");
            }
        }
    }

}
