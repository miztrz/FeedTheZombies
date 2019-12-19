
# Project documentation

Please see the [documentation](documentation/) folder for all relevant documents, including:
- [Software Development Plan](documentation/SoftwareDevelopmentPlan.md)
- [Development Log](documentation/DevelopmentLog.md)
- [Feed The Zombies Flow Chart](documentation/FeedTheZombies_Workflows.pdf)
- [Assessment Details](documentation/AssessmentDetails.md)

# How to install Feed The Zombies

Clone the directory, and then open a terminal there on your computer.

```bash
./build.sh
```
Type the above into your terminal and hit enter to install.

# How to run Feed the Zombies

In the same terminal above, type:

```bash
ruby ./dist/FTZ.rb
```

It pretty much guides you through all the steps from there. Enjoy!

## Just in case...

To test that the connection to the AI text generator is live, users can copy paste the below script into their terminal:

```bash
curl \
    -F 'text=Random text of randomnexx' \
    -H 'api-key:cf052c5c-725a-42e9-9a1d-4ac75af91c50' \
    https://api.deepai.org/api/text-generator
```



      -Φ╦,
        ╩╬╙N╥
         `╩╦ "╩D""╙╩N╗
           `╬╥        ╙Φ,
           ╔M  A*       ╚¼
         ╓Å        ,M    ╟H
        ╬H      ,╓@╜     ▐Ñ
        `Φ╗╖@M╜╙╟N       ╟H
                ▐╫      ╔Ñ
               ,╬H    ,╬╨
             ╓Φ▌,,╓╥#╩`
               ``

^[ [^ascii ^art ^generator](http://asciiart.club) ^]
