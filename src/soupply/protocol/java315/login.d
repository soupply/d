/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from protocol/java315
 */
module soupply.protocol.java315.login;

static import std.conv;
import std.system : Endian;
import std.typetuple : TypeTuple;
import packetmaker;

import soupply.util : Tuple, UUID;
import soupply.metadata.java315;
import soupply.protocol.java315.packet : Java315Packet;

static import soupply.protocol.java315.types;

alias Packets = TypeTuple!(Disconnect, LoginStart, EncryptionRequest, EncryptionResponse, LoginSuccess, SetCompression);

class Disconnect : Java315Packet
{

    enum uint ID = 0;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = false;

    enum string[] __fields = ["reason"];

    string reason;

    this() pure nothrow @safe @nogc {}

    this(string reason) pure nothrow @safe @nogc
    {
        this.reason = reason;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        Disconnect ret = new Disconnect();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "Disconnect(reason: " ~ std.conv.to!string(this.reason) ~ ")";
    }

}

class LoginStart : Java315Packet
{

    enum uint ID = 0;

    enum bool CLIENTBOUND = false;
    enum bool SERVERBOUND = true;

    enum string[] __fields = ["username"];

    string username;

    this() pure nothrow @safe @nogc {}

    this(string username) pure nothrow @safe @nogc
    {
        this.username = username;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        LoginStart ret = new LoginStart();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "LoginStart(username: " ~ std.conv.to!string(this.username) ~ ")";
    }

}

class EncryptionRequest : Java315Packet
{

    enum uint ID = 1;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = false;

    enum string[] __fields = ["serverId", "publicKey", "verifyToken"];

    string serverId;
    ubyte[] publicKey;
    ubyte[] verifyToken;

    this() pure nothrow @safe @nogc {}

    this(string serverId, ubyte[] publicKey=(ubyte[]).init, ubyte[] verifyToken=(ubyte[]).init) pure nothrow @safe @nogc
    {
        this.serverId = serverId;
        this.publicKey = publicKey;
        this.verifyToken = verifyToken;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        EncryptionRequest ret = new EncryptionRequest();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "EncryptionRequest(serverId: " ~ std.conv.to!string(this.serverId) ~ ", publicKey: " ~ std.conv.to!string(this.publicKey) ~ ", verifyToken: " ~ std.conv.to!string(this.verifyToken) ~ ")";
    }

}

class EncryptionResponse : Java315Packet
{

    enum uint ID = 1;

    enum bool CLIENTBOUND = false;
    enum bool SERVERBOUND = true;

    enum string[] __fields = ["sharedSecret", "verifyToken"];

    ubyte[] sharedSecret;
    ubyte[] verifyToken;

    this() pure nothrow @safe @nogc {}

    this(ubyte[] sharedSecret, ubyte[] verifyToken=(ubyte[]).init) pure nothrow @safe @nogc
    {
        this.sharedSecret = sharedSecret;
        this.verifyToken = verifyToken;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        EncryptionResponse ret = new EncryptionResponse();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "EncryptionResponse(sharedSecret: " ~ std.conv.to!string(this.sharedSecret) ~ ", verifyToken: " ~ std.conv.to!string(this.verifyToken) ~ ")";
    }

}

class LoginSuccess : Java315Packet
{

    enum uint ID = 2;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = false;

    enum string[] __fields = ["uuid", "username"];

    string uuid;
    string username;

    this() pure nothrow @safe @nogc {}

    this(string uuid, string username=string.init) pure nothrow @safe @nogc
    {
        this.uuid = uuid;
        this.username = username;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        LoginSuccess ret = new LoginSuccess();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "LoginSuccess(uuid: " ~ std.conv.to!string(this.uuid) ~ ", username: " ~ std.conv.to!string(this.username) ~ ")";
    }

}

class SetCompression : Java315Packet
{

    enum uint ID = 3;

    enum bool CLIENTBOUND = true;
    enum bool SERVERBOUND = false;

    enum string[] __fields = ["thresold"];

    @Var uint thresold;

    this() pure nothrow @safe @nogc {}

    this(uint thresold) pure nothrow @safe @nogc
    {
        this.thresold = thresold;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        SetCompression ret = new SetCompression();
        ret.decode(buffer);
        return ret;
    }

    public override string toString()
    {
        return "SetCompression(thresold: " ~ std.conv.to!string(this.thresold) ~ ")";
    }

}
