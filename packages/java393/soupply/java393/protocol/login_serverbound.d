/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from data/java393.xml
 */
module soupply.java393.protocol.login_serverbound;

static import std.conv;
import std.typetuple : TypeTuple;
import xpacket;

import soupply.util;
import soupply.java393.metadata : Metadata;
import soupply.java393.packet : Java393Packet;

static import soupply.java393.types;

alias Packets = TypeTuple!(LoginStart, EncryptionResponse, PluginResponse);

class LoginStart : Java393Packet
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

    override string toString()
    {
        return "LoginStart(username: " ~ std.conv.to!string(this.username) ~ ")";
    }

}

class EncryptionResponse : Java393Packet
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

    override string toString()
    {
        return "EncryptionResponse(sharedSecret: " ~ std.conv.to!string(this.sharedSecret) ~ ", verifyToken: " ~ std.conv.to!string(this.verifyToken) ~ ")";
    }

}

class PluginResponse : Java393Packet
{

    enum uint ID = 2;

    enum bool CLIENTBOUND = false;
    enum bool SERVERBOUND = true;

    enum string[] __fields = ["messageId", "successful", "data"];

    @Var uint messageId;
    bool successful;
    @Condition("successful==true") @NoLength ubyte[] data;

    this() pure nothrow @safe @nogc {}

    this(uint messageId, bool successful=bool.init, ubyte[] data=(ubyte[]).init) pure nothrow @safe @nogc
    {
        this.messageId = messageId;
        this.successful = successful;
        this.data = data;
    }

    mixin Make;

    public static typeof(this) fromBuffer(ubyte[] buffer)
    {
        PluginResponse ret = new PluginResponse();
        ret.decode(buffer);
        return ret;
    }

    override string toString()
    {
        return "PluginResponse(messageId: " ~ std.conv.to!string(this.messageId) ~ ", successful: " ~ std.conv.to!string(this.successful) ~ ", data: " ~ std.conv.to!string(this.data) ~ ")";
    }

}
