/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from bedrock261
 */
module soupply.bedrock261.metadata;

import packetmaker;
import packetmaker.maker : EndianType, writeLength, writeImpl, readLength, readImpl;

import soupply.util;

static import soupply.bedrock261.types;

class MetadataValue : PacketImpl!(Endian.littleEndian, varuint, varuint)
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

class MetadataShort : MetadataValue
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

class MetadataInt : MetadataValue
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

class MetadataFloat : MetadataValue
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

class MetadataString : MetadataValue
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

    soupply.bedrock261.types.Slot value;

    this() pure nothrow @safe @nogc
    {
        super(5);
    }

    this(soupply.bedrock261.types.Slot value) pure nothrow @safe @nogc
    {
        this();
        this.value = value;
    }

    mixin Make;

}

class MetadataBlockPosition : MetadataValue
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

class MetadataLong : MetadataValue
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

class MetadataEntityPosition : MetadataValue
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

class Metadata
{

    MetadataValue[uint] values;

    this()
    {
        this.values[0] = new MetadataLong(long(0));
        this.values[7] = new MetadataShort(short(0));
        this.values[38] = new MetadataLong(long(-1));
    }

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
                case 1:
                    auto value = new MetadataShort();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 2:
                    auto value = new MetadataInt();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 3:
                    auto value = new MetadataFloat();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 4:
                    auto value = new MetadataString();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 5:
                    auto value = new MetadataSlot();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 6:
                    auto value = new MetadataBlockPosition();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 7:
                    auto value = new MetadataLong();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                case 8:
                    auto value = new MetadataEntityPosition();
                    value.decodeBody(buffer);
                    this.values[id] = value;
                    break;
                default: throw new Exception("Unknown metadata type");
            }
        }
    }

    @property long entityFlags()
    {
        auto ptr = 0 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return long(0);
    }

    @property long entityFlags(long value)
    {
        auto ptr = 0 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[0] = new MetadataLong(value);
        return value;
    }

    @property int health()
    {
        auto ptr = 1 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int health(int value)
    {
        auto ptr = 1 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[1] = new MetadataInt(value);
        return value;
    }

    @property int variant()
    {
        auto ptr = 2 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int variant(int value)
    {
        auto ptr = 2 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[2] = new MetadataInt(value);
        return value;
    }

    @property byte color()
    {
        auto ptr = 3 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte color(byte value)
    {
        auto ptr = 3 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[3] = new MetadataByte(value);
        return value;
    }

    @property string nametag()
    {
        auto ptr = 4 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string nametag(string value)
    {
        auto ptr = 4 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[4] = new MetadataString(value);
        return value;
    }

    @property long owner()
    {
        auto ptr = 5 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return long(-1);
    }

    @property long owner(long value)
    {
        auto ptr = 5 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[5] = new MetadataLong(value);
        return value;
    }

    @property long target()
    {
        auto ptr = 6 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return (long).init;
    }

    @property long target(long value)
    {
        auto ptr = 6 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[6] = new MetadataLong(value);
        return value;
    }

    @property short air()
    {
        auto ptr = 7 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return short(0);
    }

    @property short air(short value)
    {
        auto ptr = 7 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[7] = new MetadataShort(value);
        return value;
    }

    @property int potionColor()
    {
        auto ptr = 8 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int potionColor(int value)
    {
        auto ptr = 8 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[8] = new MetadataInt(value);
        return value;
    }

    @property byte potionAmbient()
    {
        auto ptr = 9 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte potionAmbient(byte value)
    {
        auto ptr = 9 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[9] = new MetadataByte(value);
        return value;
    }

    @property int hurtTime()
    {
        auto ptr = 11 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int hurtTime(int value)
    {
        auto ptr = 11 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[11] = new MetadataInt(value);
        return value;
    }

    @property int hurtDirection()
    {
        auto ptr = 12 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int hurtDirection(int value)
    {
        auto ptr = 12 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[12] = new MetadataInt(value);
        return value;
    }

    @property float paddleTimeLeft()
    {
        auto ptr = 13 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float paddleTimeLeft(float value)
    {
        auto ptr = 13 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[13] = new MetadataFloat(value);
        return value;
    }

    @property float paddleTimeRight()
    {
        auto ptr = 14 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float paddleTimeRight(float value)
    {
        auto ptr = 14 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[14] = new MetadataFloat(value);
        return value;
    }

    @property int experienceCount()
    {
        auto ptr = 15 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int experienceCount(int value)
    {
        auto ptr = 15 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[15] = new MetadataInt(value);
        return value;
    }

    @property int minecartBlock()
    {
        auto ptr = 16 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int minecartBlock(int value)
    {
        auto ptr = 16 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[16] = new MetadataInt(value);
        return value;
    }

    @property int minecartOffset()
    {
        auto ptr = 17 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int minecartOffset(int value)
    {
        auto ptr = 17 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[17] = new MetadataInt(value);
        return value;
    }

    @property byte minecartHasBlock()
    {
        auto ptr = 18 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte minecartHasBlock(byte value)
    {
        auto ptr = 18 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[18] = new MetadataByte(value);
        return value;
    }

    @property short endermanItemId()
    {
        auto ptr = 23 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return (short).init;
    }

    @property short endermanItemId(short value)
    {
        auto ptr = 23 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[23] = new MetadataShort(value);
        return value;
    }

    @property short endermanItemDamage()
    {
        auto ptr = 24 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return (short).init;
    }

    @property short endermanItemDamage(short value)
    {
        auto ptr = 24 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[24] = new MetadataShort(value);
        return value;
    }

    @property short age()
    {
        auto ptr = 25 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return (short).init;
    }

    @property short age(short value)
    {
        auto ptr = 25 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[25] = new MetadataShort(value);
        return value;
    }

    @property byte playerFlags()
    {
        auto ptr = 27 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte playerFlags(byte value)
    {
        auto ptr = 27 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[27] = new MetadataByte(value);
        return value;
    }

    @property int playerIndex()
    {
        auto ptr = 28 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int playerIndex(int value)
    {
        auto ptr = 28 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[28] = new MetadataInt(value);
        return value;
    }

    @property Vector!(int, "xyz") bedPosition()
    {
        auto ptr = 29 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) return (cast(MetadataBlockPosition)*ptr).value;
        return (Vector!(int, "xyz")).init;
    }

    @property Vector!(int, "xyz") bedPosition(Vector!(int, "xyz") value)
    {
        auto ptr = 29 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) (cast(MetadataBlockPosition)*ptr).value = value;
        else this.values[29] = new MetadataBlockPosition(value);
        return value;
    }

    @property float fireballPowerX()
    {
        auto ptr = 30 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float fireballPowerX(float value)
    {
        auto ptr = 30 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[30] = new MetadataFloat(value);
        return value;
    }

    @property float fireballPowerY()
    {
        auto ptr = 31 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float fireballPowerY(float value)
    {
        auto ptr = 31 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[31] = new MetadataFloat(value);
        return value;
    }

    @property float fireballPowerZ()
    {
        auto ptr = 32 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float fireballPowerZ(float value)
    {
        auto ptr = 32 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[32] = new MetadataFloat(value);
        return value;
    }

    @property short potionAuxValue()
    {
        auto ptr = 37 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return (short).init;
    }

    @property short potionAuxValue(short value)
    {
        auto ptr = 37 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[37] = new MetadataShort(value);
        return value;
    }

    @property long leadHolder()
    {
        auto ptr = 38 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return long(-1);
    }

    @property long leadHolder(long value)
    {
        auto ptr = 38 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[38] = new MetadataLong(value);
        return value;
    }

    @property float scale()
    {
        auto ptr = 39 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return float(1);
    }

    @property float scale(float value)
    {
        auto ptr = 39 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[39] = new MetadataFloat(value);
        return value;
    }

    @property string interactiveTag()
    {
        auto ptr = 40 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string interactiveTag(string value)
    {
        auto ptr = 40 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[40] = new MetadataString(value);
        return value;
    }

    @property string npcId()
    {
        auto ptr = 41 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string npcId(string value)
    {
        auto ptr = 41 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[41] = new MetadataString(value);
        return value;
    }

    @property string interactiveTagUrl()
    {
        auto ptr = 42 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string interactiveTagUrl(string value)
    {
        auto ptr = 42 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[42] = new MetadataString(value);
        return value;
    }

    @property short maxAir()
    {
        auto ptr = 43 in this.values;
        if(ptr && cast(MetadataShort)*ptr) return (cast(MetadataShort)*ptr).value;
        return (short).init;
    }

    @property short maxAir(short value)
    {
        auto ptr = 43 in this.values;
        if(ptr && cast(MetadataShort)*ptr) (cast(MetadataShort)*ptr).value = value;
        else this.values[43] = new MetadataShort(value);
        return value;
    }

    @property int markVariant()
    {
        auto ptr = 44 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int markVariant(int value)
    {
        auto ptr = 44 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[44] = new MetadataInt(value);
        return value;
    }

    @property Vector!(int, "xyz") blockTarget()
    {
        auto ptr = 48 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) return (cast(MetadataBlockPosition)*ptr).value;
        return (Vector!(int, "xyz")).init;
    }

    @property Vector!(int, "xyz") blockTarget(Vector!(int, "xyz") value)
    {
        auto ptr = 48 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) (cast(MetadataBlockPosition)*ptr).value = value;
        else this.values[48] = new MetadataBlockPosition(value);
        return value;
    }

    @property int invulnerableTime()
    {
        auto ptr = 49 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int invulnerableTime(int value)
    {
        auto ptr = 49 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[49] = new MetadataInt(value);
        return value;
    }

    @property long centerHeadTarget()
    {
        auto ptr = 50 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return (long).init;
    }

    @property long centerHeadTarget(long value)
    {
        auto ptr = 50 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[50] = new MetadataLong(value);
        return value;
    }

    @property long leftHeadTarget()
    {
        auto ptr = 51 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return (long).init;
    }

    @property long leftHeadTarget(long value)
    {
        auto ptr = 51 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[51] = new MetadataLong(value);
        return value;
    }

    @property long rightHeadTarget()
    {
        auto ptr = 52 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return (long).init;
    }

    @property long rightHeadTarget(long value)
    {
        auto ptr = 52 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[52] = new MetadataLong(value);
        return value;
    }

    @property float boundingBoxWidth()
    {
        auto ptr = 54 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float boundingBoxWidth(float value)
    {
        auto ptr = 54 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[54] = new MetadataFloat(value);
        return value;
    }

    @property float boundingBoxHeight()
    {
        auto ptr = 55 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float boundingBoxHeight(float value)
    {
        auto ptr = 55 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[55] = new MetadataFloat(value);
        return value;
    }

    @property int fuseLength()
    {
        auto ptr = 56 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int fuseLength(int value)
    {
        auto ptr = 56 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[56] = new MetadataInt(value);
        return value;
    }

    @property Vector!(float, "xyz") riderSeatPosition()
    {
        auto ptr = 57 in this.values;
        if(ptr && cast(MetadataEntityPosition)*ptr) return (cast(MetadataEntityPosition)*ptr).value;
        return (Vector!(float, "xyz")).init;
    }

    @property Vector!(float, "xyz") riderSeatPosition(Vector!(float, "xyz") value)
    {
        auto ptr = 57 in this.values;
        if(ptr && cast(MetadataEntityPosition)*ptr) (cast(MetadataEntityPosition)*ptr).value = value;
        else this.values[57] = new MetadataEntityPosition(value);
        return value;
    }

    @property byte riderRotationLocked()
    {
        auto ptr = 58 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte riderRotationLocked(byte value)
    {
        auto ptr = 58 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[58] = new MetadataByte(value);
        return value;
    }

    @property float riderMaxRotation()
    {
        auto ptr = 59 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float riderMaxRotation(float value)
    {
        auto ptr = 59 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[59] = new MetadataFloat(value);
        return value;
    }

    @property float riderMinRotation()
    {
        auto ptr = 60 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return (float).init;
    }

    @property float riderMinRotation(float value)
    {
        auto ptr = 60 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[60] = new MetadataFloat(value);
        return value;
    }

    @property float areaEffectCloudRadius()
    {
        auto ptr = 61 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) return (cast(MetadataFloat)*ptr).value;
        return float(0.5);
    }

    @property float areaEffectCloudRadius(float value)
    {
        auto ptr = 61 in this.values;
        if(ptr && cast(MetadataFloat)*ptr) (cast(MetadataFloat)*ptr).value = value;
        else this.values[61] = new MetadataFloat(value);
        return value;
    }

    @property int areaEffectCloudWaiting()
    {
        auto ptr = 62 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int areaEffectCloudWaiting(int value)
    {
        auto ptr = 62 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[62] = new MetadataInt(value);
        return value;
    }

    @property int areaEffectCloudParticle()
    {
        auto ptr = 63 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int areaEffectCloudParticle(int value)
    {
        auto ptr = 63 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[63] = new MetadataInt(value);
        return value;
    }

    @property int shulkerPeakHeight()
    {
        auto ptr = 64 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int shulkerPeakHeight(int value)
    {
        auto ptr = 64 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[64] = new MetadataInt(value);
        return value;
    }

    @property byte shulkerDirection()
    {
        auto ptr = 65 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte shulkerDirection(byte value)
    {
        auto ptr = 65 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[65] = new MetadataByte(value);
        return value;
    }

    @property Vector!(int, "xyz") shulkerAttachment()
    {
        auto ptr = 67 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) return (cast(MetadataBlockPosition)*ptr).value;
        return (Vector!(int, "xyz")).init;
    }

    @property Vector!(int, "xyz") shulkerAttachment(Vector!(int, "xyz") value)
    {
        auto ptr = 67 in this.values;
        if(ptr && cast(MetadataBlockPosition)*ptr) (cast(MetadataBlockPosition)*ptr).value = value;
        else this.values[67] = new MetadataBlockPosition(value);
        return value;
    }

    @property long tradingPlayer()
    {
        auto ptr = 68 in this.values;
        if(ptr && cast(MetadataLong)*ptr) return (cast(MetadataLong)*ptr).value;
        return (long).init;
    }

    @property long tradingPlayer(long value)
    {
        auto ptr = 68 in this.values;
        if(ptr && cast(MetadataLong)*ptr) (cast(MetadataLong)*ptr).value = value;
        else this.values[68] = new MetadataLong(value);
        return value;
    }

    @property string commandBlockCommand()
    {
        auto ptr = 71 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string commandBlockCommand(string value)
    {
        auto ptr = 71 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[71] = new MetadataString(value);
        return value;
    }

    @property string commandBlockLastOutput()
    {
        auto ptr = 72 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string commandBlockLastOutput(string value)
    {
        auto ptr = 72 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[72] = new MetadataString(value);
        return value;
    }

    @property string commandBlockTrackOutput()
    {
        auto ptr = 73 in this.values;
        if(ptr && cast(MetadataString)*ptr) return (cast(MetadataString)*ptr).value;
        return (string).init;
    }

    @property string commandBlockTrackOutput(string value)
    {
        auto ptr = 73 in this.values;
        if(ptr && cast(MetadataString)*ptr) (cast(MetadataString)*ptr).value = value;
        else this.values[73] = new MetadataString(value);
        return value;
    }

    @property byte controllingRiderSeatNumber()
    {
        auto ptr = 74 in this.values;
        if(ptr && cast(MetadataByte)*ptr) return (cast(MetadataByte)*ptr).value;
        return (byte).init;
    }

    @property byte controllingRiderSeatNumber(byte value)
    {
        auto ptr = 74 in this.values;
        if(ptr && cast(MetadataByte)*ptr) (cast(MetadataByte)*ptr).value = value;
        else this.values[74] = new MetadataByte(value);
        return value;
    }

    @property int strength()
    {
        auto ptr = 75 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int strength(int value)
    {
        auto ptr = 75 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[75] = new MetadataInt(value);
        return value;
    }

    @property int maxStrength()
    {
        auto ptr = 76 in this.values;
        if(ptr && cast(MetadataInt)*ptr) return (cast(MetadataInt)*ptr).value;
        return (int).init;
    }

    @property int maxStrength(int value)
    {
        auto ptr = 76 in this.values;
        if(ptr && cast(MetadataInt)*ptr) (cast(MetadataInt)*ptr).value = value;
        else this.values[76] = new MetadataInt(value);
        return value;
    }

}
