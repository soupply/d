/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from data/java393.xml
 */
module soupply.java393.types;

static import std.conv;
import packetmaker;
import packetmaker.maker : EndianType, writeLength, readLength;

import xbuffer.memory : xalloc, xfree;

import soupply.util;
import soupply.java393.metadata;

struct Slot
{

    enum string[] __fields = ["id", "count", "nbt"];

    short id;
    @Condition("id>0") ubyte count;
    @Condition("id>0") @Bytes ubyte[] nbt;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Slot(id: " ~ std.conv.to!string(this.id) ~ ", count: " ~ std.conv.to!string(this.count) ~ ", nbt: " ~ std.conv.to!string(this.nbt) ~ ")";
    }

}

struct Particle
{

    enum string[] __fields = ["id", "dataVaruint", "dataFloat", "dataSlot"];

    @Var uint id;
    @Condition("id==3||id==20") @Var uint dataVaruint;
    @Condition("id==11") float dataFloat;
    @Condition("id==27") soupply.java393.types.Slot dataSlot;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Particle(id: " ~ std.conv.to!string(this.id) ~ ", dataVaruint: " ~ std.conv.to!string(this.dataVaruint) ~ ", dataFloat: " ~ std.conv.to!string(this.dataFloat) ~ ", dataSlot: " ~ std.conv.to!string(this.dataSlot) ~ ")";
    }

}

struct Property
{

    enum string[] __fields = ["name", "value", "signed", "signature"];

    string name;
    string value;
    bool signed;
    @Condition("signed==true") string signature;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Property(name: " ~ std.conv.to!string(this.name) ~ ", value: " ~ std.conv.to!string(this.value) ~ ", signed: " ~ std.conv.to!string(this.signed) ~ ", signature: " ~ std.conv.to!string(this.signature) ~ ")";
    }

}

struct ListAddPlayer
{

    // gamemode
    enum uint SURVIVAL = 0;
    enum uint CREATIVE = 1;
    enum uint ADVENTURE = 2;
    enum uint SPECTATOR = 3;

    enum string[] __fields = ["uuid", "name", "properties", "gamemode", "latency", "hasDisplayName", "displayName"];

    UUID uuid;
    string name;
    soupply.java393.types.Property[] properties;
    @Var uint gamemode;
    @Var uint latency;
    bool hasDisplayName;
    @Condition("hasDisplayName==true") string displayName;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "ListAddPlayer(uuid: " ~ std.conv.to!string(this.uuid) ~ ", name: " ~ std.conv.to!string(this.name) ~ ", properties: " ~ std.conv.to!string(this.properties) ~ ", gamemode: " ~ std.conv.to!string(this.gamemode) ~ ", latency: " ~ std.conv.to!string(this.latency) ~ ", hasDisplayName: " ~ std.conv.to!string(this.hasDisplayName) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ")";
    }

}

struct ListUpdateGamemode
{

    // gamemode
    enum uint SURVIVAL = 0;
    enum uint CREATIVE = 1;
    enum uint ADVENTURE = 2;
    enum uint SPECTATOR = 3;

    enum string[] __fields = ["uuid", "gamemode"];

    UUID uuid;
    @Var uint gamemode;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "ListUpdateGamemode(uuid: " ~ std.conv.to!string(this.uuid) ~ ", gamemode: " ~ std.conv.to!string(this.gamemode) ~ ")";
    }

}

struct ListUpdateLatency
{

    enum string[] __fields = ["uuid", "latency"];

    UUID uuid;
    @Var uint latency;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "ListUpdateLatency(uuid: " ~ std.conv.to!string(this.uuid) ~ ", latency: " ~ std.conv.to!string(this.latency) ~ ")";
    }

}

struct ListUpdateDisplayName
{

    enum string[] __fields = ["uuid", "hasDisplayName", "displayName"];

    UUID uuid;
    bool hasDisplayName;
    @Condition("hasDisplayName==true") string displayName;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "ListUpdateDisplayName(uuid: " ~ std.conv.to!string(this.uuid) ~ ", hasDisplayName: " ~ std.conv.to!string(this.hasDisplayName) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ")";
    }

}

struct Modifier
{

    // operation
    enum ubyte ADD_SUBSTRACT_AMOUNT = 0;
    enum ubyte ADD_SUBSTRACT_AMOUNT_PERCENTAGE = 1;
    enum ubyte MULTIPLY_AMOUNT_PERCENTAGE = 2;

    enum string[] __fields = ["uuid", "amount", "operation"];

    UUID uuid;
    double amount;
    ubyte operation;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Modifier(uuid: " ~ std.conv.to!string(this.uuid) ~ ", amount: " ~ std.conv.to!string(this.amount) ~ ", operation: " ~ std.conv.to!string(this.operation) ~ ")";
    }

}

struct Attribute
{

    enum string[] __fields = ["key", "value", "modifiers"];

    string key;
    double value;
    soupply.java393.types.Modifier[] modifiers;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Attribute(key: " ~ std.conv.to!string(this.key) ~ ", value: " ~ std.conv.to!string(this.value) ~ ", modifiers: " ~ std.conv.to!string(this.modifiers) ~ ")";
    }

}

struct Entry
{

    enum string[] __fields = ["item", "craftingSlot", "playerSlot"];

    soupply.java393.types.Slot item;
    ubyte craftingSlot;
    ubyte playerSlot;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Entry(item: " ~ std.conv.to!string(this.item) ~ ", craftingSlot: " ~ std.conv.to!string(this.craftingSlot) ~ ", playerSlot: " ~ std.conv.to!string(this.playerSlot) ~ ")";
    }

}

struct OptionalPosition
{

    enum string[] __fields = ["hasPosition", "position"];

    bool hasPosition;
    @Condition("hasPosition==true") ulong position;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "OptionalPosition(hasPosition: " ~ std.conv.to!string(this.hasPosition) ~ ", position: " ~ std.conv.to!string(this.position) ~ ")";
    }

}

struct OptionalUuid
{

    enum string[] __fields = ["hasUuid", "uuid"];

    bool hasUuid;
    UUID uuid;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "OptionalUuid(hasUuid: " ~ std.conv.to!string(this.hasUuid) ~ ", uuid: " ~ std.conv.to!string(this.uuid) ~ ")";
    }

}

struct Tag
{

    enum string[] __fields = ["name", "entries"];

    string name;
    @Var uint[] entries;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Tag(name: " ~ std.conv.to!string(this.name) ~ ", entries: " ~ std.conv.to!string(this.entries) ~ ")";
    }

}

struct Statistic
{

    enum string[] __fields = ["category", "statistic", "value"];

    @Var uint category;
    @Var uint statistic;
    @Var uint value;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Statistic(category: " ~ std.conv.to!string(this.category) ~ ", statistic: " ~ std.conv.to!string(this.statistic) ~ ", value: " ~ std.conv.to!string(this.value) ~ ")";
    }

}

struct BlockChange
{

    enum string[] __fields = ["xz", "y", "block"];

    ubyte xz;
    ubyte y;
    @Var uint block;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "BlockChange(xz: " ~ std.conv.to!string(this.xz) ~ ", y: " ~ std.conv.to!string(this.y) ~ ", block: " ~ std.conv.to!string(this.block) ~ ")";
    }

}

struct Match
{

    enum string[] __fields = ["match", "hasTooltip", "tooltip"];

    string match;
    bool hasTooltip;
    @Condition("hasTooltip==true") string tooltip;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Match(match: " ~ std.conv.to!string(this.match) ~ ", hasTooltip: " ~ std.conv.to!string(this.hasTooltip) ~ ", tooltip: " ~ std.conv.to!string(this.tooltip) ~ ")";
    }

}

struct Node
{

    enum string[] __fields = ["flags", "children", "redirectNode", "name", "parser", "properties"];

    ubyte flags;
    @Var uint[] children;
    @Condition("flags&8") @Var uint redirectNode;
    @Condition("flags&1||flags&2") string name;
    @Condition("flags&2") string parser;
    @Condition("flags&2") @Bytes ubyte[] properties;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Node(flags: " ~ std.conv.to!string(this.flags) ~ ", children: " ~ std.conv.to!string(this.children) ~ ", redirectNode: " ~ std.conv.to!string(this.redirectNode) ~ ", name: " ~ std.conv.to!string(this.name) ~ ", parser: " ~ std.conv.to!string(this.parser) ~ ", properties: " ~ std.conv.to!string(this.properties) ~ ")";
    }

}

struct Icon
{

    // type
    enum uint WHITE_ARROW = 0;
    enum uint GREEN_ARROW = 1;
    enum uint RED_ARROW = 2;
    enum uint BLUE_ARROW = 3;
    enum uint WHITE_CROSS = 4;
    enum uint RED_POINTER = 5;
    enum uint WHITE_CIRCLE = 6;
    enum uint SMALL_WHITE_CIRCLE = 7;
    enum uint MANSION = 8;
    enum uint TEMPLE = 9;
    enum uint WHITE_BANNER = 10;
    enum uint ORANGE_BANNER = 11;
    enum uint MAGENTA_BANNER = 12;
    enum uint LIGHT_BLUE_BANNER = 13;
    enum uint YELLOW_BANNER = 14;
    enum uint LIME_BANNER = 15;
    enum uint PINK_BANNER = 16;
    enum uint GRAY_BANNER = 17;
    enum uint LIGHT_GRAY_BANNER = 18;
    enum uint CYAN_BANNER = 19;
    enum uint PURPLE_BANNER = 20;
    enum uint BLUE_BANNER = 21;
    enum uint BROWN_BANNER = 22;
    enum uint GREEN_BANNER = 23;
    enum uint RED_BANNER = 24;
    enum uint BLACK_BANNER = 25;
    enum uint TREASURE_MARKER = 26;

    enum string[] __fields = ["type", "x", "z", "direction", "hasDisplayName", "displayName"];

    @Var uint type;
    ubyte x;
    ubyte z;
    ubyte direction;
    bool hasDisplayName;
    @Condition("hasDisplayName==true") string displayName;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Icon(type: " ~ std.conv.to!string(this.type) ~ ", x: " ~ std.conv.to!string(this.x) ~ ", z: " ~ std.conv.to!string(this.z) ~ ", direction: " ~ std.conv.to!string(this.direction) ~ ", hasDisplayName: " ~ std.conv.to!string(this.hasDisplayName) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ")";
    }

}

struct Recipe
{

    enum string[] __fields = ["recipeId"];

    @Var uint recipeId;

    mixin Make!(Endian.bigEndian, varuint);

    string toString()
    {
        return "Recipe(recipeId: " ~ std.conv.to!string(this.recipeId) ~ ")";
    }

}
