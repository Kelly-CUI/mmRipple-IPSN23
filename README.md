# mmRipple-IPSN23

This repository provides the codes for our IPSN 2023 paper: 
[**mmRipple: Communicating with mmWave Radars through Smartphone Vibration**](https://dl.acm.org/doi/abs/10.1145/3583120.3586956)

mmRipple aims to empower commodity mmWave radars with the communication capability through smartphone vibrations. In mmRipple, a smartphone (transmitter) sends messages by modulating smartphone vibrations, while a mmWave radar (receiver) receives the messages by detecting and decoding the smartphone vibrations with mmWave signals. By doing so, a smartphone user can not only be passively sensed by a mmWave radar, but also actively send messages to the radar using her smartphone without any hardware modifications to either the smartphone or the mmWave radar.

# Authors
Kaiyan Cui, Qiang Yang, [Yuanqing Zheng](https://www4.comp.polyu.edu.hk/~csyqzheng/) and Jinsong Han

# Workflow
mmRipple leverages a vibration motor (widely available in almost all smartphones) as a transmitter. The vibra-motor vibrates according to user-defined messages, while the mmWave radar senses such vibrations and decodes these messages. Moreover, mmRipple supports multiple objects to send messages simultaneously to a mmWave radar, and each received message implicitly carries the location context of the corresponding object thanks to the spatial information from sensing.

![workflow](https://github.com/Kelly-CUI/mmRipple-IPSN23/assets/77531118/0eba338c-432e-422f-865f-fc90f572fc07)



# Application
We envision some applications that could benefit from the communication functionality enabled by mmRipple: 1) Pedestrian-to-infrastructure (P2I) communication. Pedestrians can leverage their smartphone vibrations to send messages to the traffic light with mmWave radars and actively influence traffic control decisions. For example, after receiving the "crossing" message from an elderly, the traffic light can track her crossing progress to extend the flashing green time for her safety. 2) Location-based services (LBS). Smart appliances equipped with mmWave radars can provide personalized services based on the location of the sender. The sweeping robot can locate the user and clean the area around her upon request. 3) Multiple object interaction. mmRipple allows mmWave radars to track multiple users and simultaneously collect their messages in a contact-free manner, which can be used for ticket checking (e.g., COVID-19 vaccine passport checking) to reduce the risk of the virus spreading and shorten the queuing time.

![app](https://github.com/Kelly-CUI/mmRipple-IPSN23/assets/77531118/d2a32fed-cdc5-4773-a986-3e2277d5daee)

# Dataset
Please download the dataset ['test.bin'](https://drive.google.com/file/d/1oETuszpPbCQH9WjFLQ_n-T0qpOwHcuen/view?usp=drive_link) and then put it in the 'Data' file.

# Cite
Please consider to cite our paper if you use the code in your research project.
```bibtex
@inproceedings{cui2023mmripple,
  title={mmRipple: Communicating with mmWave Radars through Smartphone Vibration},
  author={Cui, Kaiyan and Yang, Qiang and Zheng, Yuanqing and Han, Jinsong},
  booktitle={Proceedings of the 22nd International Conference on Information Processing in Sensor Networks (IPSN)},
  pages={149--162},
  year={2023}
}
```
