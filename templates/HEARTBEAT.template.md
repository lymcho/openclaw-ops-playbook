# HEARTBEAT.md

## Departure Reminders

Check if user needs to leave soon for upcoming calendar events:

1. Get next 2-5 events with locations:
   ```bash
   gog calendar list --account YOU@gmail.com --max 5 --json
   ```

2. For events with a `location` field that start within 2 hours:
   - Calculate drive time: `~/.openclaw/workspace/scripts/driving-eta.sh "LOCATION"`
   - If leaving time is within 30 minutes, send a reminder

3. For back-to-back events:
   - Use previous event's location as origin (not home):
     `driving-eta.sh "next location" "current location"`

4. **Only alert if action needed** — don't spam with "you have plenty of time"

Example reminder format:
> 🚗 **Leave in ~15 min** for [Event Name]
> Drive time: 14 min (with traffic)
> Event starts: 8:30am

## Skip if:
- Late night (11pm - 7am)
- No upcoming events with locations in next 2 hours
- Already reminded about this event

---

## CRM Check-ins

Once daily (morning preferred), review `CRM.md`:

1. Check if anyone's **Next Due** date has passed or is today
2. If overdue, send a nudge with context:
   > 💬 **Time to reach out to [Name]** (last: X ago)
   > *Context: [their notes]*
3. Keep it actionable — suggest what to say if context allows

**After user reaches out:** Update `Last Contact` and recalculate `Next Due`

**Skip if:** Already reminded today about the same person

---

## State Tracking

Track what you've already checked in `memory/heartbeat-state.json`:

```json
{
  "lastChecks": {
    "email": null,
    "calendar": null,
    "crm": null,
    "weather": null
  },
  "remindedEvents": [],
  "remindedCRM": []
}
```

This prevents duplicate reminders and helps you rotate through checks efficiently.
