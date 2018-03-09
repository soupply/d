/*
 * This file has been automatically generated by Soupply and released un the MIT license.
 */
module soupply.protocol.java315.serverbound;

static import std.conv;
import std.system : Endian;
import std.typetuple : TypeTuple;
import packetmaker;

import soupply.util : Tuple, UUID;
import soupply.metadata.java315;
import soupply.protocol.java315.packet : Java315Packet;

static import soupply.protocol.java315.types;

alias Packets = TypeTuple!(TeleportConfirm, TabComplete, ChatMessage, ClientStatus, ClientSettings, ConfirmTransaction, EnchantItem, ClickWindow, CloseWindow, PluginMessage, UseEntity, KeepAlive, PlayerPosition, PlayerPositionAndLook, PlayerLook, Player, VehicleMove, SteerBoat, PlayerAbilities, PlayerDigging, EntityAction, SteerVehicle, ResourcePackStatus, HeldItemChange, CreativeInventoryAction, UpdateSign, Animation, Spectate, PlayerBlockPlacement, UseItem);

class TeleportConfirm : Java315Packet
{

	enum uint ID = 0;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["teleportId"];

	@Var uint teleportId;

	this() pure nothrow @safe @nogc {}

	this(uint teleportId) pure nothrow @safe @nogc
	{
		this.teleportId = teleportId;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		TeleportConfirm ret = new TeleportConfirm();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "TeleportConfirm(teleportId: " ~ std.conv.to!string(this.teleportId) ~ ")";
	}

}

class TabComplete : Java315Packet
{

	enum uint ID = 1;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["text", "command", "hasPosition", "block"];

	string text;
	bool command;
	bool hasPosition;
	@Condition("hasPosition==true") ulong block;

	this() pure nothrow @safe @nogc {}

	this(string text, bool command=bool.init, bool hasPosition=bool.init, ulong block=ulong.init) pure nothrow @safe @nogc
	{
		this.text = text;
		this.command = command;
		this.hasPosition = hasPosition;
		this.block = block;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		TabComplete ret = new TabComplete();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "TabComplete(text: " ~ std.conv.to!string(this.text) ~ ", command: " ~ std.conv.to!string(this.command) ~ ", hasPosition: " ~ std.conv.to!string(this.hasPosition) ~ ", block: " ~ std.conv.to!string(this.block) ~ ")";
	}

}

class ChatMessage : Java315Packet
{

	enum uint ID = 2;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["text"];

	string text;

	this() pure nothrow @safe @nogc {}

	this(string text) pure nothrow @safe @nogc
	{
		this.text = text;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ChatMessage ret = new ChatMessage();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ChatMessage(text: " ~ std.conv.to!string(this.text) ~ ")";
	}

}

class ClientStatus : Java315Packet
{

	enum uint ID = 3;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// action
	enum uint RESPAWN = 0;
	enum uint REQUEST_STATS = 1;
	enum uint OPEN_INVENTORY = 2;

	enum string[] __fields = ["action"];

	@Var uint action;

	this() pure nothrow @safe @nogc {}

	this(uint action) pure nothrow @safe @nogc
	{
		this.action = action;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ClientStatus ret = new ClientStatus();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ClientStatus(action: " ~ std.conv.to!string(this.action) ~ ")";
	}

}

class ClientSettings : Java315Packet
{

	enum uint ID = 4;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// chat mode
	enum uint ENABLED = 0;
	enum uint COMMANDS_ONLY = 1;
	enum uint DISABLED = 2;

	// displayed skin parts
	enum ubyte CAPE = 1;
	enum ubyte JACKET = 2;
	enum ubyte LEFT_SLEEVE = 4;
	enum ubyte RIGHT_SLEEVE = 8;
	enum ubyte LEFT_PANTS = 16;
	enum ubyte RIGHT_PANTS = 32;
	enum ubyte HAT = 64;

	// main hand
	enum ubyte RIGHT = 0;
	enum ubyte LEFT = 1;

	enum string[] __fields = ["language", "viewDistance", "chatMode", "chatColors", "displayedSkinParts", "mainHand"];

	string language;
	ubyte viewDistance;
	@Var uint chatMode;
	bool chatColors;
	ubyte displayedSkinParts;
	ubyte mainHand;

	this() pure nothrow @safe @nogc {}

	this(string language, ubyte viewDistance=ubyte.init, uint chatMode=uint.init, bool chatColors=bool.init, ubyte displayedSkinParts=ubyte.init, ubyte mainHand=ubyte.init) pure nothrow @safe @nogc
	{
		this.language = language;
		this.viewDistance = viewDistance;
		this.chatMode = chatMode;
		this.chatColors = chatColors;
		this.displayedSkinParts = displayedSkinParts;
		this.mainHand = mainHand;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ClientSettings ret = new ClientSettings();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ClientSettings(language: " ~ std.conv.to!string(this.language) ~ ", viewDistance: " ~ std.conv.to!string(this.viewDistance) ~ ", chatMode: " ~ std.conv.to!string(this.chatMode) ~ ", chatColors: " ~ std.conv.to!string(this.chatColors) ~ ", displayedSkinParts: " ~ std.conv.to!string(this.displayedSkinParts) ~ ", mainHand: " ~ std.conv.to!string(this.mainHand) ~ ")";
	}

}

class ConfirmTransaction : Java315Packet
{

	enum uint ID = 5;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["window", "action", "accepted"];

	ubyte window;
	ushort action;
	bool accepted;

	this() pure nothrow @safe @nogc {}

	this(ubyte window, ushort action=ushort.init, bool accepted=bool.init) pure nothrow @safe @nogc
	{
		this.window = window;
		this.action = action;
		this.accepted = accepted;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ConfirmTransaction ret = new ConfirmTransaction();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ConfirmTransaction(window: " ~ std.conv.to!string(this.window) ~ ", action: " ~ std.conv.to!string(this.action) ~ ", accepted: " ~ std.conv.to!string(this.accepted) ~ ")";
	}

}

class EnchantItem : Java315Packet
{

	enum uint ID = 6;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["window", "enchantment"];

	ubyte window;
	ubyte enchantment;

	this() pure nothrow @safe @nogc {}

	this(ubyte window, ubyte enchantment=ubyte.init) pure nothrow @safe @nogc
	{
		this.window = window;
		this.enchantment = enchantment;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		EnchantItem ret = new EnchantItem();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "EnchantItem(window: " ~ std.conv.to!string(this.window) ~ ", enchantment: " ~ std.conv.to!string(this.enchantment) ~ ")";
	}

}

class ClickWindow : Java315Packet
{

	enum uint ID = 7;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["window", "slot", "button", "action", "mode", "clickedItem"];

	ubyte window;
	ushort slot;
	ubyte button;
	ushort action;
	@Var uint mode;
	soupply.protocol.java315.types.Slot clickedItem;

	this() pure nothrow @safe @nogc {}

	this(ubyte window, ushort slot=ushort.init, ubyte button=ubyte.init, ushort action=ushort.init, uint mode=uint.init, soupply.protocol.java315.types.Slot clickedItem=soupply.protocol.java315.types.Slot.init) pure nothrow @safe @nogc
	{
		this.window = window;
		this.slot = slot;
		this.button = button;
		this.action = action;
		this.mode = mode;
		this.clickedItem = clickedItem;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ClickWindow ret = new ClickWindow();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ClickWindow(window: " ~ std.conv.to!string(this.window) ~ ", slot: " ~ std.conv.to!string(this.slot) ~ ", button: " ~ std.conv.to!string(this.button) ~ ", action: " ~ std.conv.to!string(this.action) ~ ", mode: " ~ std.conv.to!string(this.mode) ~ ", clickedItem: " ~ std.conv.to!string(this.clickedItem) ~ ")";
	}

}

class CloseWindow : Java315Packet
{

	enum uint ID = 8;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["window"];

	ubyte window;

	this() pure nothrow @safe @nogc {}

	this(ubyte window) pure nothrow @safe @nogc
	{
		this.window = window;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		CloseWindow ret = new CloseWindow();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "CloseWindow(window: " ~ std.conv.to!string(this.window) ~ ")";
	}

}

class PluginMessage : Java315Packet
{

	enum uint ID = 9;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["channel", "data"];

	string channel;
	@Bytes ubyte[] data;

	this() pure nothrow @safe @nogc {}

	this(string channel, ubyte[] data=(ubyte[]).init) pure nothrow @safe @nogc
	{
		this.channel = channel;
		this.data = data;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PluginMessage ret = new PluginMessage();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PluginMessage(channel: " ~ std.conv.to!string(this.channel) ~ ", data: " ~ std.conv.to!string(this.data) ~ ")";
	}

}

class UseEntity : Java315Packet
{

	enum uint ID = 10;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// type
	enum uint INTERACT = 0;
	enum uint ATTACK = 1;
	enum uint INTERACT_AT = 2;

	// hand
	enum uint MAIN_HAND = 0;
	enum uint OFF_HAND = 1;

	enum string[] __fields = ["target", "type", "targetPosition", "hand"];

	@Var uint target;
	@Var uint type;
	@Condition("type==2") Tuple!(float, "xyz") targetPosition;
	@Condition("type==0||type==2") @Var uint hand;

	this() pure nothrow @safe @nogc {}

	this(uint target, uint type=uint.init, Tuple!(float, "xyz") targetPosition=Tuple!(float, "xyz").init, uint hand=uint.init) pure nothrow @safe @nogc
	{
		this.target = target;
		this.type = type;
		this.targetPosition = targetPosition;
		this.hand = hand;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		UseEntity ret = new UseEntity();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "UseEntity(target: " ~ std.conv.to!string(this.target) ~ ", type: " ~ std.conv.to!string(this.type) ~ ", targetPosition: " ~ std.conv.to!string(this.targetPosition) ~ ", hand: " ~ std.conv.to!string(this.hand) ~ ")";
	}

}

class KeepAlive : Java315Packet
{

	enum uint ID = 11;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["id"];

	@Var uint id;

	this() pure nothrow @safe @nogc {}

	this(uint id) pure nothrow @safe @nogc
	{
		this.id = id;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		KeepAlive ret = new KeepAlive();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "KeepAlive(id: " ~ std.conv.to!string(this.id) ~ ")";
	}

}

class PlayerPosition : Java315Packet
{

	enum uint ID = 12;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["position", "onGround"];

	Tuple!(double, "xyz") position;
	bool onGround;

	this() pure nothrow @safe @nogc {}

	this(Tuple!(double, "xyz") position, bool onGround=bool.init) pure nothrow @safe @nogc
	{
		this.position = position;
		this.onGround = onGround;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerPosition ret = new PlayerPosition();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerPosition(position: " ~ std.conv.to!string(this.position) ~ ", onGround: " ~ std.conv.to!string(this.onGround) ~ ")";
	}

}

class PlayerPositionAndLook : Java315Packet
{

	enum uint ID = 13;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["position", "yaw", "pitch", "onGround"];

	Tuple!(double, "xyz") position;
	float yaw;
	float pitch;
	bool onGround;

	this() pure nothrow @safe @nogc {}

	this(Tuple!(double, "xyz") position, float yaw=float.init, float pitch=float.init, bool onGround=bool.init) pure nothrow @safe @nogc
	{
		this.position = position;
		this.yaw = yaw;
		this.pitch = pitch;
		this.onGround = onGround;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerPositionAndLook ret = new PlayerPositionAndLook();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerPositionAndLook(position: " ~ std.conv.to!string(this.position) ~ ", yaw: " ~ std.conv.to!string(this.yaw) ~ ", pitch: " ~ std.conv.to!string(this.pitch) ~ ", onGround: " ~ std.conv.to!string(this.onGround) ~ ")";
	}

}

class PlayerLook : Java315Packet
{

	enum uint ID = 14;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["yaw", "pitch", "onGround"];

	float yaw;
	float pitch;
	bool onGround;

	this() pure nothrow @safe @nogc {}

	this(float yaw, float pitch=float.init, bool onGround=bool.init) pure nothrow @safe @nogc
	{
		this.yaw = yaw;
		this.pitch = pitch;
		this.onGround = onGround;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerLook ret = new PlayerLook();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerLook(yaw: " ~ std.conv.to!string(this.yaw) ~ ", pitch: " ~ std.conv.to!string(this.pitch) ~ ", onGround: " ~ std.conv.to!string(this.onGround) ~ ")";
	}

}

class Player : Java315Packet
{

	enum uint ID = 15;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["onGround"];

	bool onGround;

	this() pure nothrow @safe @nogc {}

	this(bool onGround) pure nothrow @safe @nogc
	{
		this.onGround = onGround;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		Player ret = new Player();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "Player(onGround: " ~ std.conv.to!string(this.onGround) ~ ")";
	}

}

class VehicleMove : Java315Packet
{

	enum uint ID = 16;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["position", "yaw", "pitch"];

	Tuple!(double, "xyz") position;
	float yaw;
	float pitch;

	this() pure nothrow @safe @nogc {}

	this(Tuple!(double, "xyz") position, float yaw=float.init, float pitch=float.init) pure nothrow @safe @nogc
	{
		this.position = position;
		this.yaw = yaw;
		this.pitch = pitch;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		VehicleMove ret = new VehicleMove();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "VehicleMove(position: " ~ std.conv.to!string(this.position) ~ ", yaw: " ~ std.conv.to!string(this.yaw) ~ ", pitch: " ~ std.conv.to!string(this.pitch) ~ ")";
	}

}

class SteerBoat : Java315Packet
{

	enum uint ID = 17;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["rightPaddleTurning", "leftPaddleTurning"];

	bool rightPaddleTurning;
	bool leftPaddleTurning;

	this() pure nothrow @safe @nogc {}

	this(bool rightPaddleTurning, bool leftPaddleTurning=bool.init) pure nothrow @safe @nogc
	{
		this.rightPaddleTurning = rightPaddleTurning;
		this.leftPaddleTurning = leftPaddleTurning;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		SteerBoat ret = new SteerBoat();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "SteerBoat(rightPaddleTurning: " ~ std.conv.to!string(this.rightPaddleTurning) ~ ", leftPaddleTurning: " ~ std.conv.to!string(this.leftPaddleTurning) ~ ")";
	}

}

class PlayerAbilities : Java315Packet
{

	enum uint ID = 18;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// flags
	enum ubyte CREATIVE_MODE = 1;
	enum ubyte FLYING = 2;
	enum ubyte ALLOW_FLYING = 4;
	enum ubyte INVINCIBLE = 8;

	enum string[] __fields = ["flags", "flyingSpeed", "walkingSpeed"];

	ubyte flags;
	float flyingSpeed;
	float walkingSpeed;

	this() pure nothrow @safe @nogc {}

	this(ubyte flags, float flyingSpeed=float.init, float walkingSpeed=float.init) pure nothrow @safe @nogc
	{
		this.flags = flags;
		this.flyingSpeed = flyingSpeed;
		this.walkingSpeed = walkingSpeed;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerAbilities ret = new PlayerAbilities();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerAbilities(flags: " ~ std.conv.to!string(this.flags) ~ ", flyingSpeed: " ~ std.conv.to!string(this.flyingSpeed) ~ ", walkingSpeed: " ~ std.conv.to!string(this.walkingSpeed) ~ ")";
	}

}

class PlayerDigging : Java315Packet
{

	enum uint ID = 19;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// status
	enum uint START_DIGGING = 0;
	enum uint CANCEL_DIGGING = 1;
	enum uint FINISH_DIGGING = 2;
	enum uint DROP_ITEM_STACK = 3;
	enum uint DROP_ITEM = 4;
	enum uint SHOOT_ARROW = 5;
	enum uint FINISH_EATING = 5;
	enum uint SWAP_ITEM_IN_HAND = 6;

	enum string[] __fields = ["status", "position", "face"];

	@Var uint status;
	ulong position;
	ubyte face;

	this() pure nothrow @safe @nogc {}

	this(uint status, ulong position=ulong.init, ubyte face=ubyte.init) pure nothrow @safe @nogc
	{
		this.status = status;
		this.position = position;
		this.face = face;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerDigging ret = new PlayerDigging();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerDigging(status: " ~ std.conv.to!string(this.status) ~ ", position: " ~ std.conv.to!string(this.position) ~ ", face: " ~ std.conv.to!string(this.face) ~ ")";
	}

}

class EntityAction : Java315Packet
{

	enum uint ID = 20;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// action
	enum uint START_SNEAKING = 0;
	enum uint STOP_SNEAKING = 1;
	enum uint LEAVE_BED = 2;
	enum uint START_SPRINTING = 3;
	enum uint STOP_SPRINTING = 4;
	enum uint START_HORSE_JUMP = 5;
	enum uint STOP_HORSE_JUMP = 6;
	enum uint OPEN_HORSE_INVENTORY = 7;
	enum uint START_ELYTRA_FLYING = 8;

	enum string[] __fields = ["entityId", "action", "jumpBoost"];

	@Var uint entityId;
	@Var uint action;
	@Var uint jumpBoost;

	this() pure nothrow @safe @nogc {}

	this(uint entityId, uint action=uint.init, uint jumpBoost=uint.init) pure nothrow @safe @nogc
	{
		this.entityId = entityId;
		this.action = action;
		this.jumpBoost = jumpBoost;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		EntityAction ret = new EntityAction();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "EntityAction(entityId: " ~ std.conv.to!string(this.entityId) ~ ", action: " ~ std.conv.to!string(this.action) ~ ", jumpBoost: " ~ std.conv.to!string(this.jumpBoost) ~ ")";
	}

}

class SteerVehicle : Java315Packet
{

	enum uint ID = 21;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// flags
	enum ubyte JUMP = 1;
	enum ubyte UNMOUNT = 2;

	enum string[] __fields = ["sideways", "forward", "flags"];

	float sideways;
	float forward;
	ubyte flags;

	this() pure nothrow @safe @nogc {}

	this(float sideways, float forward=float.init, ubyte flags=ubyte.init) pure nothrow @safe @nogc
	{
		this.sideways = sideways;
		this.forward = forward;
		this.flags = flags;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		SteerVehicle ret = new SteerVehicle();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "SteerVehicle(sideways: " ~ std.conv.to!string(this.sideways) ~ ", forward: " ~ std.conv.to!string(this.forward) ~ ", flags: " ~ std.conv.to!string(this.flags) ~ ")";
	}

}

class ResourcePackStatus : Java315Packet
{

	enum uint ID = 22;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// result
	enum uint LOADED = 0;
	enum uint DECLINED = 1;
	enum uint FAILED = 2;
	enum uint ACCEPTED = 3;

	enum string[] __fields = ["result"];

	@Var uint result;

	this() pure nothrow @safe @nogc {}

	this(uint result) pure nothrow @safe @nogc
	{
		this.result = result;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		ResourcePackStatus ret = new ResourcePackStatus();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "ResourcePackStatus(result: " ~ std.conv.to!string(this.result) ~ ")";
	}

}

class HeldItemChange : Java315Packet
{

	enum uint ID = 23;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["slot"];

	ushort slot;

	this() pure nothrow @safe @nogc {}

	this(ushort slot) pure nothrow @safe @nogc
	{
		this.slot = slot;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		HeldItemChange ret = new HeldItemChange();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "HeldItemChange(slot: " ~ std.conv.to!string(this.slot) ~ ")";
	}

}

class CreativeInventoryAction : Java315Packet
{

	enum uint ID = 24;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["slot", "clickedItem"];

	ushort slot;
	soupply.protocol.java315.types.Slot clickedItem;

	this() pure nothrow @safe @nogc {}

	this(ushort slot, soupply.protocol.java315.types.Slot clickedItem=soupply.protocol.java315.types.Slot.init) pure nothrow @safe @nogc
	{
		this.slot = slot;
		this.clickedItem = clickedItem;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		CreativeInventoryAction ret = new CreativeInventoryAction();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "CreativeInventoryAction(slot: " ~ std.conv.to!string(this.slot) ~ ", clickedItem: " ~ std.conv.to!string(this.clickedItem) ~ ")";
	}

}

class UpdateSign : Java315Packet
{

	enum uint ID = 25;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["position", "lines"];

	ulong position;
	string[4] lines;

	this() pure nothrow @safe @nogc {}

	this(ulong position, string[4] lines=(string[4]).init) pure nothrow @safe @nogc
	{
		this.position = position;
		this.lines = lines;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		UpdateSign ret = new UpdateSign();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "UpdateSign(position: " ~ std.conv.to!string(this.position) ~ ", lines: " ~ std.conv.to!string(this.lines) ~ ")";
	}

}

class Animation : Java315Packet
{

	enum uint ID = 26;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// hand
	enum uint MAIN_HAND = 0;
	enum uint OFF_HAND = 1;

	enum string[] __fields = ["hand"];

	@Var uint hand;

	this() pure nothrow @safe @nogc {}

	this(uint hand) pure nothrow @safe @nogc
	{
		this.hand = hand;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		Animation ret = new Animation();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "Animation(hand: " ~ std.conv.to!string(this.hand) ~ ")";
	}

}

class Spectate : Java315Packet
{

	enum uint ID = 27;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	enum string[] __fields = ["player"];

	UUID player;

	this() pure nothrow @safe @nogc {}

	this(UUID player) pure nothrow @safe @nogc
	{
		this.player = player;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		Spectate ret = new Spectate();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "Spectate(player: " ~ std.conv.to!string(this.player) ~ ")";
	}

}

class PlayerBlockPlacement : Java315Packet
{

	enum uint ID = 28;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// hand
	enum uint MAIN_HAND = 0;
	enum uint OFF_HAND = 1;

	enum string[] __fields = ["position", "face", "hand", "cursorPosition"];

	ulong position;
	@Var uint face;
	@Var uint hand;
	Tuple!(float, "xyz") cursorPosition;

	this() pure nothrow @safe @nogc {}

	this(ulong position, uint face=uint.init, uint hand=uint.init, Tuple!(float, "xyz") cursorPosition=Tuple!(float, "xyz").init) pure nothrow @safe @nogc
	{
		this.position = position;
		this.face = face;
		this.hand = hand;
		this.cursorPosition = cursorPosition;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		PlayerBlockPlacement ret = new PlayerBlockPlacement();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "PlayerBlockPlacement(position: " ~ std.conv.to!string(this.position) ~ ", face: " ~ std.conv.to!string(this.face) ~ ", hand: " ~ std.conv.to!string(this.hand) ~ ", cursorPosition: " ~ std.conv.to!string(this.cursorPosition) ~ ")";
	}

}

class UseItem : Java315Packet
{

	enum uint ID = 29;

	enum bool CLIENTBOUND = false;
	enum bool SERVERBOUND = true;

	// hand
	enum uint MAIN_HAND = 0;
	enum uint OFF_HAND = 1;

	enum string[] __fields = ["hand"];

	@Var uint hand;

	this() pure nothrow @safe @nogc {}

	this(uint hand) pure nothrow @safe @nogc
	{
		this.hand = hand;
	}

	mixin Make;

	public static typeof(this) fromBuffer(ubyte[] buffer)
	{
		UseItem ret = new UseItem();
		ret.decode(buffer);
		return ret;
	}

	public override string toString()
	{
		return "UseItem(hand: " ~ std.conv.to!string(this.hand) ~ ")";
	}

}

