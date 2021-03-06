/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from test0
 */
module soupply.test0.metadata;

import xpacket;

import xserial.serial : EndianType, serializeLength, serializeNumber, deserializeLength, deserializeNumber;

import soupply.util;

static import soupply.test0.types;

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

class Metadata
{

    MetadataValue[uint] values;

    this()
    {
    }

    void serialize(Buffer buffer)
    {
        serializeLength!(EndianType.var, uint)(buffer, values.length);
        foreach(id, value; values)
        {
            serializeNumber!(EndianType.var, uint)(buffer, id);
            value.encodeBody(buffer);
        }
    }

    void deserialize(Buffer buffer)
    {
        foreach(i ; 0..deserializeLength!(EndianType.var, uint)(buffer))
        {
            uint id = deserializeNumber!(EndianType.var, uint)(buffer);
            switch(deserializeNumber!(EndianType.var, uint)(buffer))
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
