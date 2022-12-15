

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://discord.gg/G9zzDPvF4Y">
    <img src="https://i.imgur.com/kqu8Gp4.png" alt="Logo" width="180" height="180">
  </a>

  <h3 align="center">LifePeak - Skripts</h3>
  <a href="https://discord.gg/G9zzDPvF4Y">
  <img src="https://badgen.net/discord/members/G9zzDPvF4Y"> </img>
  </a>
  <p align="center">
    Any fool can write code that a computer can understand. Good programmers write code that humans can understand!
    <br />
    <a href="https://lifepeak-scripts.tebex.io"><strong>Explore us on Tebex  »»</strong></a>
    <br />
    <br />
    <a href="https://www.youtube.com/channel/UC8tftArZtDQz_0bohnnidoA">View Demos</a>
    ·
    <a href="https://discord.gg/G9zzDPvF4Y">Report Bug</a>
    ·
    <a href="https://discord.gg/G9zzDPvF4Y">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS 
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
-->


<!-- ABOUT THE PROJECT -->
## Explore Lifepeak
### What's Lifepeak-Scripts?
Lifepeak is a small developing team of three members. We are specialized in Five-M Scripting, Hosting, Managing Servers.






### What we offer ?

This section list our Supported Programming Languages and Frameworks.

### Programming Languages:
![C#](https://img.shields.io/badge/c%23-%23239120.svg?style=for-the-badge&logo=c-sharp&logoColor=white)
![C++](https://img.shields.io/badge/c++-%2300599C.svg?style=for-the-badge&logo=c%2B%2B&logoColor=white)
![Go](https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

### Frameworks:
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Laravel](https://img.shields.io/badge/laravel-%23FF2D20.svg?style=for-the-badge&logo=laravel&logoColor=white)
![Qt](https://img.shields.io/badge/Qt-%23217346.svg?style=for-the-badge&logo=Qt&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)

--------------
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Which Platforms we're supporting?
We're currently supporting this platforms if you have any Questions regarding Linux or Windows feel free to contact us.

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)


## Interested? Find us on:

 * [![](https://img.shields.io/badge/Lifepeak-%237289DA.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/G9zzDPvF4Y)
 * [![](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://discord.gg/G9zzDPvF4Y)
 * [![](https://img.shields.io/badge/gitlab-%23181717.svg?style=for-the-badge&logo=gitlab&logoColor=white)](https://gitlab.lifepeak.de/lifepeak-freescripts)
 * [![](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=yellow)](https://lifepeak.de/)

<!-- GETTING STARTED -->










# lp_cardealer

The script is designed to be user-friendly and intuitive, 
with a simple interface that allows players to quickly browse the available cars and make their purchases. 
The script also allows to create unlimted  dealerships. Overall,
the LifePeak CarDealer script adds an exciting and immersive element to the gameplay experience.



### Installation

1. Download the Script at [Lifepeak-Gitlab](https://gitlab.lifepeak.de/lifepeak-freescripts/lp_speedcamera) and drag the lp_speedcamera folder into your resources folder.
2. Before you start you should read the config.lua and make changes if necessary.
   ```lua
   Config = {}

   Config.Locale = "en"
   Config.PlateUseSpace = true          --Spacer Between Letters and Numbers
   Config.PlateLetters  = 3             -- Letters on Plate    [LFP] 123
   Config.PlateNumbers  = 3             -- Numbers on Plate    LFP [123]
   
   Config.CarDealer = {
    {
        name = "Autohaus",
        coords = vector3(-34.63,-1676.08,29.49),
        spawnpos = vector3(-26.98,-1679.63,29.45),
        spawnHeading = 112.71,
        blips = {
            type = 225,
            color = 1,
            scale = 1.0
        },
        cars = {
            {
                name = "burrito",
                label = "Van",
                price = 15600,
                coord = vector3(-52.058,-1693.59,28.49),
                heading = 7.40
            },
        }
    },
    {
        name = "Bike Store",
        coords = vector3(-141.49,6354.39,31.49),
        spawnpos = vector3(-141.17,6353.34,31.49),
        spawnHeading = 112.71,
        blips = {
            type = 226,
            color = 1,
            scale = 1.0
        },
        cars = {
            {
                name = "akuma",
                label = "Akuma",
                price = 12400,
                coord = vector3(-155.17,6357.63,30.49),
                heading = 266.27
            },
        }
    },
   }


   ```
3. add the staring command to your server.cfg
   ```cfg
   start lp_cardealer
   ```
It is recommended to use a billing system.
-> esx_billing
-> okokBilling
### If you have any questions, contact the LifePeak team.
<p align="right">(<a href="#readme-top">back to top</a>)</p>





