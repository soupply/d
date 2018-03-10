/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from java210
 */
module soupply.protocol.java210.status;

static import std.conv;
import std.system : Endian;
import std.typetuple : TypeTuple;
import packetmaker;

import soupply.util : Tuple, UUID;
import soupply.metadata.java210;
import soupply.protocol.java210.packet : Java210Packet;

static import soupply.protocol.java210.types;

alias Packets = TypeTuple!(Handshake, Request, Response, Latency);

class Handshake : Java210Packet
{

    enum uint ID = 0;

    enum bool CLIENTBOUND = false;
    enum bool SERVERBOUND = true;

    // next
    enum uint STATUS = 1;
    enum uint LOGIN = 2;

    enum string[] __fields = ["protocol", "serverAddress", "serverPort", "next"];

    @Var uint protocol;
    string serverAddress;
    ushort serverPort;
    @Var uint next;

    this() pure nothrow @safe @nogc {}

    this(uint protocol, string serverAddress=string.init, ushort serverPort=ushort.init, uint next=uint.init) pure nothrow @safe @nogc
    {
        this.protocol = protocol;
        this.serverAddress = serverAddress;
        this.serverPort = serverPort;
        this.next = next;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        Handshake ret = new Handshake();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "Handshake(protocol: " ~ std.conv.to!string(this.protocol) ~ ", serverAddress: " ~ std.conv.to!string(this.serverAddress) ~ ", serverPort: " ~ std.conv.to!string(this.serverPort) ~ ", next: " ~ std.conv.to!string(this.next) ~ ")";
    }

}

class Request : Java210Packet
{

    enum uint ID = 0;

    enum bool CLIENTBOUND = false;
    enum bool SERVERBOUND = true;

    enum string[] __fields = [];

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        Request ret = new Request();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "Request()";
    }

}

class Response : Java210Packet
{

    enum uint ID = 0;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = false;

    enum string[] __fields = ["json"];

    string json;

    this() pure nothrow @safe @nogc {}

    this(string json) pure nothrow @safe @nogc
    {
        this.json = json;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        Response ret = new Response();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "Response(json: " ~ std.conv.to!string(this.json) ~ ")";
    }

}

class Latency : Java210Packet
{

    enum uint ID = 1;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = true;

    enum string[] __fields = ["id"];

    long id;

    this() pure nothrow @safe @nogc {}

    this(long id) pure nothrow @safe @nogc
    {
        this.id = id;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        Latency ret = new Latency();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "Latency(id: " ~ std.conv.to!string(this.id) ~ ")";
    }

}
