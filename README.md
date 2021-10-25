# Relaunch
Small iOS utility to relaunch an application.

## Usage
`> rela com.app.bundleid`

*Ensure that `/usr/local/bin/` is in `$PATH`.*

## Installation
It's available at [my repo](https://zerui18.github.io/zx02/).

## Components
* /usr/local/bin/rela
    * Sends requests via `NSDistributedNotificationCenter` to the SpringBoard tweak.
* SpringBoard Tweak
    * Listens for requests. Once received, terminate app if it's running and relaunch it. (Using `FBSSystemService`).

## TODO
- [ ] Figure out proper value to use for `terminateApplication ... forReason: (long long) reason`.