# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## Google Workspace (gog)

**Authenticated account:** `you@gmail.com`

**Auth expired?** Re-auth with: `gog auth add you@gmail.com --force-consent`

Use `gog` for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.

Common commands:
- Calendar events: `gog calendar list --account you@gmail.com`
- Gmail search (headers only): `gog gmail search 'newer_than:7d' --account you@gmail.com`
- **Gmail read full email:** `gog gmail read <messageId> --account you@gmail.com`
- Gmail send: `gog gmail send --to recipient@email.com --subject "Subject" --body "Message" --account you@gmail.com`

**To read email body:**
1. Search to get message IDs: `gog gmail search 'from:someone' --account you@gmail.com`
2. Read full message: `gog gmail read <ID_FROM_SEARCH> --account you@gmail.com`

## Driving ETA Tool

**Script:** `~/.openclaw/workspace/scripts/driving-eta.sh`

Calculate driving time with real-time traffic:

```bash
# From home to destination
~/.openclaw/workspace/scripts/driving-eta.sh "destination address"

# From custom origin to destination
~/.openclaw/workspace/scripts/driving-eta.sh "destination" "origin"
```

**For calendar events with locations:**
1. Get next event: `gog calendar list --account you@gmail.com --max 1 --json`
2. Extract the `location` field
3. Run driving-eta.sh with that location
4. If back-to-back events, use previous event's location as origin

## Audio Transcription (Optional)

**Script:** `~/.openclaw/workspace/scripts/transcribe-audio.py`

```bash
# Basic transcription
python3 ~/.openclaw/workspace/scripts/transcribe-audio.py "audio_file.ogg"

# Transcription + AI summary
python3 ~/.openclaw/workspace/scripts/transcribe-audio.py "audio_file.mp3" --summarize
```

Supported formats: mp3, mp4, mpeg, mpga, m4a, wav, webm, ogg

For voice messages from Telegram, files arrive in `~/.openclaw/media/inbound/`.

## Saved Locations

- **Home:** [Your address]
- **Work:** [Your work address]
- **School:** [If applicable]

**Directions API Key:** `[Your Google Directions API key]`

## Project Paths

- `~/Desktop/projects` → [Your projects root]

---

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.
