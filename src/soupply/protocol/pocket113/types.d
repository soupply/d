/*
 * This file has been automatically generated by Soupply and released un the MIT license.
 * Generated from protocol/pocket113
 */
module soupply.protocol.pocket113.types;

import std.bitmanip : write, peek;
static import std.conv;
import std.system : Endian;
import packetmaker;

import soupply.util : Tuple, UUID;
import soupply.metadata.pocket113;

struct LoginBody
{

	enum string[] __fields = ["chain", "clientData"];

	@EndianLength!uint(Endian.littleEndian) ubyte[] chain;
	@EndianLength!uint(Endian.littleEndian) ubyte[] clientData;

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
	@LittleEndian ulong size;

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
	@Condition("id>0") @EndianLength!ushort(Endian.littleEndian) ubyte[] nbt;
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

	@LittleEndian long mostSignificantBits;
	@LittleEndian long leastSignificantBits;

	public string toString()
	{
		return "McpeUuid(mostSignificantBits: " ~ std.conv.to!string(this.mostSignificantBits) ~ ", leastSignificantBits: " ~ std.conv.to!string(this.leastSignificantBits) ~ ")";
	}

}

struct Skin
{

	enum string[] __fields = ["name", "data"];

	string name;
	ubyte[] data;

	public string toString()
	{
		return "Skin(name: " ~ std.conv.to!string(this.name) ~ ", data: " ~ std.conv.to!string(this.data) ~ ")";
	}

}

struct PlayerList
{

	enum string[] __fields = ["uuid", "entityId", "displayName", "skin"];

	soupply.protocol.pocket113.types.McpeUuid uuid;
	@Var long entityId;
	string displayName;
	soupply.protocol.pocket113.types.Skin skin;

	public string toString()
	{
		return "PlayerList(uuid: " ~ std.conv.to!string(this.uuid) ~ ", entityId: " ~ std.conv.to!string(this.entityId) ~ ", displayName: " ~ std.conv.to!string(this.displayName) ~ ", skin: " ~ std.conv.to!string(this.skin) ~ ")";
	}

}

struct Link
{

	// action
	enum ubyte ADD = 0;
	enum ubyte RIDE = 1;
	enum ubyte REMOVE = 2;

	enum string[] __fields = ["from", "to", "action"];

	@Var long from;
	@Var long to;
	ubyte action;

	public string toString()
	{
		return "Link(from: " ~ std.conv.to!string(this.from) ~ ", to: " ~ std.conv.to!string(this.to) ~ ", action: " ~ std.conv.to!string(this.action) ~ ")";
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

struct ChunkData
{

	enum string[] __fields = ["sections", "heights", "biomes", "borders", "extraData", "blockEntities"];

	soupply.protocol.pocket113.types.Section[] sections;
	ushort[256] heights;
	ubyte[256] biomes;
	ubyte[] borders;
	soupply.protocol.pocket113.types.ExtraData[] extraData;
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

	enum string[] __fields = ["storageVersion", "blockIds", "blockMetas", "skyLight", "blockLight"];

	ubyte storageVersion = 0;
	ubyte[4096] blockIds;
	ubyte[2048] blockMetas;
	ubyte[2048] skyLight;
	ubyte[2048] blockLight;

	public string toString()
	{
		return "Section(storageVersion: " ~ std.conv.to!string(this.storageVersion) ~ ", blockIds: " ~ std.conv.to!string(this.blockIds) ~ ", blockMetas: " ~ std.conv.to!string(this.blockMetas) ~ ", skyLight: " ~ std.conv.to!string(this.skyLight) ~ ", blockLight: " ~ std.conv.to!string(this.blockLight) ~ ")";
	}

}

struct ExtraData
{

	enum string[] __fields = ["key", "value"];

	@Var uint key;
	@LittleEndian ushort value;

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
	@LittleEndian uint color;

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
	@Condition("type==2") int integerValue;
	@Condition("type==3") float floatingValue;

	public string toString()
	{
		return "Rule(name: " ~ std.conv.to!string(this.name) ~ ", type: " ~ std.conv.to!string(this.type) ~ ", booleanValue: " ~ std.conv.to!string(this.booleanValue) ~ ", integerValue: " ~ std.conv.to!string(this.integerValue) ~ ", floatingValue: " ~ std.conv.to!string(this.floatingValue) ~ ")";
	}

}

