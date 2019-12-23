# FEED THE ZOMBIES

[![BCH compliance](https://bettercodehub.com/edge/badge/miztrz/FeedTheZombies?branch=master)](https://bettercodehub.com/)

## What goes into Feed The Zombies

"Feed The Zombies" is a terminal application I built using Ruby, supported by some interesting gems, 2 of which require an API key to connect with. Its not very smart, or very flash, but it does beat the old "Lorem Ipsum" generated text for building webpages with!

### What API keys will I need?

"[News API](https://newsapi.org/) is a simple and easy-to-use API that returns JSON metadata for headlines and articles live all over the web right now." _register [here](https://newsapi.org/register)_

"[Deep AI](https://deepai.org/) Text Generation API. This transformer-based language model, based on the GPT-2 model by OpenAI, intakes a sentence or partial sentence and predicts subsequent text from that input." _register [here](https://deepai.org/)_

## How to install Feed The Zombies

Clone this directory, and then open a terminal to the folder you have just cloned into.

```bash
./build.sh
```

Type the above into your terminal and hit enter to install.

### Possible install errors

When re-installing this project, I ran into this error:

```bash
Building native extensions. This could take a while...
ERROR:  Error installing rest-client:
ERROR: Failed to build gem native extension.
  current directory: /var/lib/gems/2.5.0/gems/unf_ext-0.0.7.6/ext/unf_ext/usr/bin/ruby2.5 -r ./siteconf20191220-12110-1w674vc.rb extconf.rb
  mkmf.rb can't find header files for ruby at /usr/lib/ruby/include/ruby.h

 extconf failed, exit code 1

 Gem files will remain installed in /var/lib/gems/2.5.0/gems/unf_ext-0.0.7.6 for inspection.
 Results logged to /var/lib/gems/2.5.0/extensions/x86_64-linux/2.5.0/unf_ext-0.0.7.6/gem_make.out
```

After a Google search, I found this [StackExchange question](https://stackoverflow.com/questions/22544754/failed-to-build-gem-native-extension-installing-compass), suggesting ruby-dev could solve this. I installed it, and it fixed it.

If you run into issues, please let me know so I can fix/document them.

## How to run Feed the Zombies

In the same terminal above, type:

```bash
ruby ./dist/FTZ.rb
```

It pretty much guides you through all the steps from there. Enjoy!

### Just in case...

To test that the connection to the AI text generator is live, users can copy paste the below script into their terminal:

```bash
curl \
    -F 'text=Random text of randomnexx' \
    -H 'api-key:[insert your api key]' \
    https://api.deepai.org/api/text-generator
```

mizcodes
-Φ╦,
╩╬╙N╥
`╩╦ "╩D""╙╩N╗`╬╥ ╙Φ,
╔M A\* ╚¼
╓Å ,M ╟H
╬H ,╓@╜ ▐Ñ
`Φ╗╖@M╜╙╟N ╟H ▐╫ ╔Ñ ,╬H ,╬╨ ╓Φ▌,,╓╥#╩`
``

<!--
NEWSAPI_KEY=f37a599d478547949f0205df90df8c49
DEEPAI_KEY=cf052c5c-725a-42e9-9a1d-4ac75af91c50 -->
