## $$\color{blue}{\mathbf{UE\text{ }VM}}$$

## Set up
```
TODO
```


## Start Scripts

### Start all UE's

To start four different UE's with slices (internet, iot, edge, and  CustomSlice) as well as a gnb that they attatch to:

```console
user@ue_vm$ ./start_me.sh #By default starts Classic_Core ./start_me.sh <Mode> (ex. Double_upf)
```

Below is an example of starting the Classic_Core

![Start Classic Core on UE VM](../Media/start_classic_uevm.gif)

And also the Double_upf:
Here we can see that unlike in the Classic_Core mode Double_upf utilizies two different data networks, so half of the ue are routed to 10.45.0.1/16 and the other half to 10.47.0.1/16

![Start Classic Core on UE VM](../Media/start_doubleupf_uevm.gif)
