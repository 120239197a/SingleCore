/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef MANGOS_SYSTEMCONFIG_H
#define MANGOS_SYSTEMCONFIG_H

#ifndef _PACKAGENAME
#define _PACKAGENAME "SingleCore"
#endif

#include "../../config.h"
#include "Platform/Define.h"

#ifndef _VERSION
# define _VERSION(REVN) MANGOS_VERSION " (Revision " REVN ")"
#endif

#ifndef _R2VERSION
# define _R2VERSION(REVD,REVT,REVN,REVH) "mangosR2 branch" " (" REVD " " REVT " R2 Revision " REVN " commit " REVH ")"
#endif

// Format is YYYYMMDDRR where RR is the change in the conf file
// for that day.
#ifndef _MANGOSDCONFVERSION
# define _MANGOSDCONFVERSION 2013012201
#endif
#ifndef _REALMDCONFVERSION
# define _REALMDCONFVERSION 2010062001
#endif

#if MANGOS_ENDIAN == MANGOS_BIGENDIAN
# define _ENDIAN_STRING "big-endian"
#else
# define _ENDIAN_STRING "little-endian"
#endif

#if defined(i386) || defined(__i386) || defined(__i386__) || defined(_M_IX86)
# define ARCHITECTURE "x32"
#elif defined(__amd64) || defined(__amd64__) || defined(__x86_64) || defined(_M_X64)
# define ARCHITECTURE "x64"
#elif defined(__ia64)  || defined(__IA64__)  || defined(_M_IA64)
# define ARCHITECTURE "IA64"
#else
# define ARCHITECTURE "x32"
#endif

// The path to config files
#ifndef SYSCONFDIR
#  define SYSCONFDIR        ""
#endif

#if PLATFORM == PLATFORM_WINDOWS
# ifdef _WIN64
#  define _ENDIAN_PLATFORM "Win64 (" _ENDIAN_STRING ")"
# else
#  define _ENDIAN_PLATFORM "Win32 (" _ENDIAN_STRING ")"
# endif
# define _MANGOSD_CONFIG  SYSCONFDIR"world.conf"
# define _MANGCHAT_CONFIG  SYSCONFDIR"mangchat.conf"
# define _REALMD_CONFIG   SYSCONFDIR"login.conf"
# define _AUCTIONHOUSEBOT_CONFIG   SYSCONFDIR"ahbot.conf"
#else
# if defined  (__FreeBSD__)
#  define _ENDIAN_PLATFORM "FreeBSD_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# elif defined(__NetBSD__)
#  define _ENDIAN_PLATFORM "NetBSD_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# elif defined(__OpenBSD__)
#  define _ENDIAN_PLATFORM "OpenBSD_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# elif defined(__DragonFly__)
#  define _ENDIAN_PLATFORM "DragonFlyBSD_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# elif defined(__APPLE__)
#  define _ENDIAN_PLATFORM "MacOSX_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# elif defined(__linux) || defined(__linux__)
#  define _ENDIAN_PLATFORM "Linux_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# else
#  define _ENDIAN_PLATFORM "Unix_"ARCHITECTURE" (" _ENDIAN_STRING ")"
# endif
# define _MANGOSD_CONFIG  SYSCONFDIR"worldangosd.conf"
# define _MANGCHAT_CONFIG  SYSCONFDIR"mangchat.conf"
# define _REALMD_CONFIG  SYSCONFDIR"login.conf"
# define _AUCTIONHOUSEBOT_CONFIG   SYSCONFDIR"ahbot.conf"
#endif

#define _FULLVERSION(REVN) _PACKAGENAME "/" _VERSION(REVN)
#define _R2FULLVERSION(REVD,REVT,REVN,REVH) _R2VERSION(REVD,REVT,REVN,REVH) " for " _ENDIAN_PLATFORM

#define EXPECTED_MANGOSD_CLIENT_BUILD {12340, 0}

#define CLIENT_VERSION 12340

#if CLIENT_VERSION >= 16057
    #define MAX_EXPANSION 4
#elif CLIENT_VERSION >= 13623
    #define MAX_EXPANSION 3
#elif CLIENT_VERSION > 8606
    #define MAX_EXPANSION 2
#elif CLIENT_VERSION > 6005
    #define MAX_EXPANSION 1
#else
    #define MAX_EXPANSION 0
#endif

#define DEFAULT_PLAYER_LIMIT 100
#define DEFAULT_WORLDSERVER_PORT 8085                       //8129
#define DEFAULT_REALMSERVER_PORT 3724
#endif
