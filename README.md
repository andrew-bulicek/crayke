![crayke-icon-github](icon/crayke-icon-github.png)

# Crayke

A simple bash script for syncing media playback between users.

## Why?

There are a bunch of good options for syncing playback of media, like [rabb.it](https://www.rabb.it/). However, I couldn't find a simple app or script to sync playback of *locally stored* media. My problem was twofold in that I was watching these videos while on a video call, and one of us would end up ahead or behind the other and we'd be reacting at different times. Yes, I have OCD.

## How It Works

I tried to make it as simple as possible, for universal ease of use. The trick to making it act sort of like a "app" is making the script executable. You can do so by running this command in terminal once you've downloaded the script:

```bash
chmod +x Crayke.sh
```

After that, the script can be ran by simply double clicking it. You can also take it a step further on Mac OS and move it to your Dock by changing the extension from .sh to .app, dragging it onto the Dock, then changing the extension back to .sh.

Once the script is running, instructions take you through each step of the way.

## FAQ

- **So how does it actually work?** The script doesn't control VLC in any way, really. What is does is allow the users to input a time, then converts that to UNIX time to syncronize everything, and start the playback of the file at exactly that time.
- **What if I need to pause the video?** Currently, the script doesn't allow for pausing. The initial use case was for short video files, played from the beginning to end without stopping; though it could be modified to allow for this functionality. Fork away, terminal f~~r~~iends.
- **Can I use the icon for the script?** Yes! Right click on the script and select "Get Info". In the top left corner there will be an icon of document – drag the "crayke-icon.icns" on top of that.
- **Why "Crayke"?** [Oryx and Crake](https://www.amazon.com/Crake-MaddAddam-Trilogy-Margaret-Atwood/dp/0385721676). Recommended.