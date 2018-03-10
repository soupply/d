/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 * Generated from bedrock150
 */
module soupply.protocol.bedrock150.types;

import std.bitmanip : write, peek;
static import std.conv;
import std.system : Endian;
import packetmaker;

import soupply.util : Tuple, UUID;
import soupply.metadata.bedrock150;

struct LoginBody
{

    enum string[] __fields = ["chain", "clientData"];

    @Length!uint ubyte[] chain;
    @Length!uint ubyte[] clientData;

    void encodeBody(InputBuffer buffer)
    {
    }

    void decodeBody(OutputBuffer buffer)
    {
    }

    public string toString()
    {
        return "LoginBody(chain: " ~ std.conv.to!string(this.chain) ~ ", clientData: " ~ std.conv.to!string(this.clientData) ~ ")";
    }

}

struct PackWithSize
{

    enum string[] __fields = ["id", "version_", "size"];

    string id;
    string version_;
    ulong size;

    public string toString()
    {
        return "PackWithSize(id: " ~ std.conv.to!string(this.id) ~ ", version_: " ~ std.conv.to!string(this.version_) ~ ", size: " ~ std.conv.to!string(this.size) ~ ")";
    }

}

struct Pack
{

    enum string[] __fields = ["id", "version_"];

    string id;
    string version_;

    public string toString()
    {
        return "Pack(id: " ~ std.conv.to!string(this.id) ~ ", version_: " ~ std.conv.to!string(this.version_) ~ ")";
    }

}

struct Slot
{

    enum string[] __fields = ["id", "metaAndCount", "nbt", "canPlaceOn", "canDestroy"];

    @Var int id;
    @Condition("id>0") @Var int metaAndCount;
    @Condition("id>0") @Length!ushort ubyte[] nbt;
    string[] canPlaceOn;
    string[] canDestroy;

    public string toString()
    {
        return "Slot(id: " ~ std.conv.to!string(this.id) ~ ", metaAndCount: " ~ std.conv.to!string(this.metaAndCount) ~ ", nbt: " ~ std.conv.to!string(this.nbt) ~ ", canPlaceOn: " ~ std.conv.to!string(this.canPlaceOn) ~ ", canDestroy: " ~ std.conv.to!string(this.canDestroy) ~ ")";
    }

}

struct Attribute
{

    enum string[] __fields = ["min", "max", "value", "default_", "name"];

    float min;
    float max;
    float value;
    float default_;
    string name;

    public string toString()
    {
        return "Attribute(min: " ~ std.conv.to!string(this.min) ~ ", max: " ~ std.conv.to!string(this.max) ~ ", value: " ~ std.conv.to!string(this.value) ~ ", default_: " ~ std.conv.to!string(this.default_) ~ ", name: " ~ std.conv.to!string(this.name) ~ ")";
    }

}

struct BlockPosition
{

    enum string[] __fields = ["x", "y", "z"];

    @Var int x;
    @Var uint y;
    @Var int z;

    public string toString()
    {
        return "BlockPosition(x: " ~ std.conv.to!string(this.x) ~ ", y: " ~ std.conv.to!string(this.y) ~ ", z: " ~ std.conv.to!string(this.z) ~ ")";
    }

}

struct McpeUuid
{

    enum string[] __fields = ["mostSignificantBits", "leastSignificantBits"];

    long mostSignificantBits;
    long leastSignificantBits;

    public string toString()
    {
        return "McpeUuid(mostSignificantBits: " ~ std.conv.to!string(this.mostSignificantBits) ~ ", leastSignificantBits: " ~ std.conv.to!string(this.leastSignificantBits) ~ ")";
    }

}

struct PlayerList
{

    enum string[] __fields = ["uuid", "entityId", "displayName", "skin", "unknown4"];

    soupply.protocol.bedrock150.types.McpeUuid uuid;
    @Var long entityId;
    string displayName;
    soupply.protocol.bedrock150.types.Skin skin;
    string unknown4;

    public string toString()
    {
        return "PlayerList(uuid: " ~ std.conv.to!string(this.uuid) ~ ", entityId: " ~ std.conv.to!string(this.entityId) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ", skin: " ~ std.conv.to!string(this.skin) ~ ", unknown4: " ~ std.conv.to!string(this.unknown4) ~ ")";
    }

}

struct Skin
{

    enum string[] __fields = ["name", "data", "capeData", "geometryName", "geometryData"];

    string name;
    ubyte[] data;
    ubyte[] capeData;
    string geometryName;
    ubyte[] geometryData;

    public string toString()
    {
        return "Skin(name: " ~ std.conv.to!string(this.name) ~ ", data: " ~ std.conv.to!string(this.data) ~ ", capeData: " ~ std.conv.to!string(this.capeData) ~ ", geometryName: " ~ std.conv.to!string(this.geometryName) ~ ", geometryData: " ~ std.conv.to!string(this.geometryData) ~ ")";
    }

}

struct Link
{

    // action
    enum ubyte ADD = 0;
    enum ubyte RIDE = 1;
    enum ubyte REMOVE = 2;

    enum string[] __fields = ["from", "to", "action", "unknown3"];

    @Var long from;
    @Var long to;
    ubyte action;
    ubyte unknown3;

    public string toString()
    {
        return "Link(from: " ~ std.conv.to!string(this.from) ~ ", to: " ~ std.conv.to!string(this.to) ~ ", action: " ~ std.conv.to!string(this.action) ~ ", unknown3: " ~ std.conv.to!string(this.unknown3) ~ ")";
    }

}

struct Recipe
{

    // type
    enum int SHAPELESS = 0;
    enum int SHAPED = 1;
    enum int FURNACE = 2;
    enum int FURNACE_DATA = 3;
    enum int MULTI = 4;

    enum string[] __fields = ["type", "data"];

    @Var int type;
    @Bytes ubyte[] data;

    public string toString()
    {
        return "Recipe(type: " ~ std.conv.to!string(this.type) ~ ", data: " ~ std.conv.to!string(this.data) ~ ")";
    }

}

struct InventoryAction
{

    // source
    enum uint CONTAINER = 0;
    enum uint WORLD = 2;
    enum uint CREATIVE = 3;

    enum string[] __fields = ["source", "container", "unknown2", "slot", "oldItem", "newItem"];

    @Var uint source;
    @Condition("source==0") @Var int container = -1;
    @Condition("source==2") @Var uint unknown2;
    @Var uint slot;
    soupply.protocol.bedrock150.types.Slot oldItem;
    soupply.protocol.bedrock150.types.Slot newItem;

    public string toString()
    {
        return "InventoryAction(source: " ~ std.conv.to!string(this.source) ~ ", container: " ~ std.conv.to!string(this.container) ~ ", unknown2: " ~ std.conv.to!string(this.unknown2) ~ ", slot: " ~ std.conv.to!string(this.slot) ~ ", oldItem: " ~ std.conv.to!string(this.oldItem) ~ ", newItem: " ~ std.conv.to!string(this.newItem) ~ ")";
    }

}

struct ChunkData
{

    enum string[] __fields = ["sections", "heights", "biomes", "borders", "extraData", "blockEntities"];

    soupply.protocol.bedrock150.types.Section[] sections;
    ushort[256] heights;
    ubyte[256] biomes;
    ubyte[] borders;
    soupply.protocol.bedrock150.types.ExtraData[] extraData;
    @Bytes ubyte[] blockEntities;

    void encodeBody(InputBuffer buffer)
    {
    }

    void decodeBody(OutputBuffer buffer)
    {
    }

    public string toString()
    {
        return "ChunkData(sections: " ~ std.conv.to!string(this.sections) ~ ", heights: " ~ std.conv.to!string(this.heights) ~ ", biomes: " ~ std.conv.to!string(this.biomes) ~ ", borders: " ~ std.conv.to!string(this.borders) ~ ", extraData: " ~ std.conv.to!string(this.extraData) ~ ", blockEntities: " ~ std.conv.to!string(this.blockEntities) ~ ")";
    }

}

struct Section
{

    enum string[] __fields = ["storageVersion", "blockIds", "blockMetas"];

    ubyte storageVersion = 0;
    ubyte[4096] blockIds;
    ubyte[2048] blockMetas;

    public string toString()
    {
        return "Section(storageVersion: " ~ std.conv.to!string(this.storageVersion) ~ ", blockIds: " ~ std.conv.to!string(this.blockIds) ~ ", blockMetas: " ~ std.conv.to!string(this.blockMetas) ~ ")";
    }

}

struct ExtraData
{

    enum string[] __fields = ["key", "value"];

    @Var uint key;
    ushort value;

    public string toString()
    {
        return "ExtraData(key: " ~ std.conv.to!string(this.key) ~ ", value: " ~ std.conv.to!string(this.value) ~ ")";
    }

}

struct Decoration
{

    enum string[] __fields = ["rotationAndIcon", "position", "label", "color"];

    @Var int rotationAndIcon;
    Tuple!(ubyte, "xz") position;
    string label;
    uint color;

    public string toString()
    {
        return "Decoration(rotationAndIcon: " ~ std.conv.to!string(this.rotationAndIcon) ~ ", position: " ~ std.conv.to!string(this.position) ~ ", label: " ~ std.conv.to!string(this.label) ~ ", color: " ~ std.conv.to!string(this.color) ~ ")";
    }

}

struct Rule
{

    // name
    enum string COMMAND_BLOCK_OUTPUT = "commandblockoutput";
    enum string DO_DAYLIGHT_CYCLE = "dodaylightcycle";
    enum string DO_ENTITY_DROPS = "doentitydrops";
    enum string DO_FIRE_TICK = "dofiretick";
    enum string DO_MOB_LOOT = "domobloot";
    enum string DO_MOB_SPAWNING = "domobspawning";
    enum string DO_TILE_DROPS = "dotiledrops";
    enum string DO_WEATHER_CYCLE = "doweathercycle";
    enum string DROWNING_DAMAGE = "drowningdamage";
    enum string FALL_DAMAGE = "falldamage";
    enum string FIRE_DAMAGE = "firedamage";
    enum string KEEP_INVENTORY = "keepinventory";
    enum string MOB_GRIEFING = "mobgriefing";
    enum string PVP = "pvp";
    enum string SEND_COMMAND_FEEDBACK = "sendcommandfeedback";

    // type
    enum ubyte BOOLEAN = 1;
    enum ubyte INTEGER = 2;
    enum ubyte FLOATING = 3;

    enum string[] __fields = ["name", "type", "booleanValue", "integerValue", "floatingValue"];

    string name;
    ubyte type;
    @Condition("type==1") bool booleanValue;
    @Condition("type==2") @Var uint integerValue;
    @Condition("type==3") float floatingValue;

    public string toString()
    {
        return "Rule(name: " ~ std.conv.to!string(this.name) ~ ", type: " ~ std.conv.to!string(this.type) ~ ", booleanValue: " ~ std.conv.to!string(this.booleanValue) ~ ", integerValue: " ~ std.conv.to!string(this.integerValue) ~ ", floatingValue: " ~ std.conv.to!string(this.floatingValue) ~ ")";
    }

}

struct Enum
{

    enum string[] __fields = ["name", "valuesIndexes"];

    string name;
    ushort[] valuesIndexes;

    public string toString()
    {
        return "Enum(name: " ~ std.conv.to!string(this.name) ~ ", valuesIndexes: " ~ std.conv.to!string(this.valuesIndexes) ~ ")";
    }

}

struct Command
{

    enum string[] __fields = ["name", "description", "unknown2", "permissionLevel", "aliasesEnum", "overloads"];

    string name;
    string description;
    ubyte unknown2;
    ubyte permissionLevel;
    int aliasesEnum = -1;
    soupply.protocol.bedrock150.types.Overload[] overloads;

    public string toString()
    {
        return "Command(name: " ~ std.conv.to!string(this.name) ~ ", description: " ~ std.conv.to!string(this.description) ~ ", unknown2: " ~ std.conv.to!string(this.unknown2) ~ ", permissionLevel: " ~ std.conv.to!string(this.permissionLevel) ~ ", aliasesEnum: " ~ std.conv.to!string(this.aliasesEnum) ~ ", overloads: " ~ std.conv.to!string(this.overloads) ~ ")";
    }

}

struct Overload
{

    enum string[] __fields = ["parameters"];

    soupply.protocol.bedrock150.types.Parameter[] parameters;

    public string toString()
    {
        return "Overload(parameters: " ~ std.conv.to!string(this.parameters) ~ ")";
    }

}

struct Parameter
{

    // type
    enum uint VALID = 1048576;
    enum uint INT = 1;
    enum uint FLOAT = 2;
    enum uint MIXED = 3;
    enum uint TARGET = 4;
    enum uint STRING = 13;
    enum uint POSITION = 14;
    enum uint RAWTEXT = 17;
    enum uint TEXT = 19;
    enum uint JSON = 22;
    enum uint COMMAND = 29;
    enum uint ENUM = 2097152;
    enum uint TEMPLATE = 16777216;

    enum string[] __fields = ["name", "type", "optional"];

    string name;
    uint type;
    bool optional;

    public string toString()
    {
        return "Parameter(name: " ~ std.conv.to!string(this.name) ~ ", type: " ~ std.conv.to!string(this.type) ~ ", optional: " ~ std.conv.to!string(this.optional) ~ ")";
    }

}
