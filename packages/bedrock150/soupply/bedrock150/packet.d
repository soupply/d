/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 */
module soupply.bedrock150.packet;

import xpacket;

import soupply.util : Pad;

alias Bedrock150Packet = Pad!(2, PacketImpl!(Endian.littleEndian, varuint, varuint));
