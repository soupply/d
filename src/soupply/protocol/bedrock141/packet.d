/*
 * This file has been automatically generated by Soupply and released under the MIT license.
 */
module soupply.protocol.bedrock141.packet;

import packetmaker;

import soupply.util : Pad;

alias Bedrock141Packet = Pad!(2, PacketImpl!(Endian.littleEndian, varuint, varuint));
