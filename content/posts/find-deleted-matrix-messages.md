---
title: "Find Deleted Matrix Messages"
date: 2021-11-23T22:07:26-06:00
description: "How to troll your friends by digging up their deleted Matrix messages"
type: "post"
tags: ["Linux", "Self-hosting"]
---


It feels like I haven't written a blog post in forever, and plus, I want to test Hugo's code block formatting.

Anyways, time for something actually fun and useful...

So you self-host a Matrix server, right? If not, this guide won't be very useful. It's still hilarious though.

If you ever get tired of ghost pings or trolls quickly deleting their Matrix messages, you can troll them right back. The Synapse Matrix server keeps deleted messages for about a week in the database before permanently deleting them. That means you can dig them right back out in only two minutes.

First, open up a PostgreSQL console for your Synapse database. On Arch Linux, you can do that like this:
```
sudo -iu postgres
PAGER=less psql -d synapse
```

Now go into your Matrix client and find the internal room ID for the room where the message was deleted. In Element, you can find this in the Advanced tab of the room settings. The room ID should look something like `!GtIfdsfQtQIgbQSxwJ:archlinux.org` (in this case, the infamous [Arch Linux room](https://matrix.to/#/#archlinux:archlinux.org)).

Time for some SQL! Use this command to find the redacted message in the `event_json` table, which should be at the bottom of the output:
```
select * from event_json where room_id='!GtIfdsfQtQIgbQSxwJ:archlinux.org';
```

See which `event_id` that the redaction is redacting. Now find that `event_id` in the `event_json` and you've found the deleted message!
```
select * from event_json where event_id='$74R4Y1W9cf_mblMogX7bONx_hk3xIqcB8FCOXydUV2M';
```

Fun, isn't it? Anyways, maybe it'll be useful someday.
