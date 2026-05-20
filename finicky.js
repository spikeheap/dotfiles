export default {
  //defaultBrowser: "Brave Browser",
  //defaultBrowser: "Safari",
  defaultBrowser: "Vivaldi",

  hideIcon: true,
  keepRunning: true,
  
  rewrite: [
    // Force https for all urls
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#force-https-for-all-urls
    // Not needed with Vivaldi because it does this (in config)
    // {
    //   // Redirect all urls to use https
    //   match: ({ url }) => url.protocol === "http",
    //   url: { protocol: "https" }
    // },

    // Remove all marketing/tracking information from urls
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#remove-all-marketingtracking-information-from-urls  
    {
      match: () => true, // Execute rewrite on all incoming urls to make this example easier to understand
      url({ url }) {
        const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
        const removeKeys = ["fblid", "gclid"]; // Remove all query parameters matching these keys

        const search = url.search
          .split("&")
          .map((parameter) => parameter.split("="))
          .filter(([key]) => !removeKeysStartingWith.some((startingWith) => key.startsWith(startingWith)))
          .filter(([key]) => !removeKeys.some((removeKey) => key === removeKey));

        return {
          ...url,
          search: search.map((parameter) => parameter.join("=")).join("&"),
        };
      },
    }
  ],

  handlers: [
    // {
    //   match: [
    //     // "meet.google.com/*",
    //     "*.google.com/*",
    //     "*.github.com/*",
    //     "plus.probely.app/*",
    //     "dashboard.gitguardian.com/*",
    //     "*.atlassian.com/*",
    //     "*.atlassian.net/*",
        
    //     // Client domains
    //     "*.hackney.gov.uk/*", // while they're a client
    //   ],
    //   browser: "Brave Browser"
    // },


    // Open Apple Music links directly in Music.app
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#open-apple-music-links-in-the-music-app
    {
      match: [
          "music.apple.com*",
          "geo.music.apple.com*",
      ],
      url: {
          protocol: "itmss"
      },
      browser: "Music",
    },

    // Open Zoom invites in Zoom app
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#open-zoom-links-in-zoom-app-with-or-without-password
    {
      match: /zoom\.us\/join/,
      browser: "us.zoom.xos"
    },

    // Open Microsoft Teams links in the native app
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#open-microsoft-teams-links-in-the-native-app
    {
      match: finicky.matchHostnames(['teams.microsoft.com']),
      browser: 'com.microsoft.teams',
      url: ({url}) =>
          ({...url, protocol: 'msteams'}),
    }
  ]
};