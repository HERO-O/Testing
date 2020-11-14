import 'package:camera/camera.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';


class Screenone extends StatefulWidget{
  @override
  _ScreenoneState createState()=> _ScreenoneState();
  }

  class _ScreenoneState extends State<Screenone>{
    List<CameraDescription> _camera;
    CameraController _controller;

    VideoPlayerController _v1;
    ChewieController _chewieController;
    double volume=0.5;
    @override
    void initState(){
      super.initState();
      
      this.initializePlayer();
      _v1.addListener(() {
        setState(() {
          volume =_v1.value.volume;
        });
        });
    }

    @override
    void dispose(){
      _controller.dispose();
      _v1.dispose();
      _chewieController.dispose();
    super.dispose();
    }
      
    Future<void> initializePlayer() async{
      
      _v1=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
      _chewieController =ChewieController(
        videoPlayerController: _v1,
        looping:true,
        autoInitialize:true,
        allowMuting: false,   
        showControls: true,
        
        allowPlaybackSpeedChanging: false,
        aspectRatio: 16/9,
        autoPlay:true,
               
        
      );
      _camera=await availableCameras();
      _controller=CameraController(_camera[1],ResolutionPreset.medium);
      _controller.initialize();
      setState(() {
        
      });
      
    }
        @override
        Widget build(BuildContext context) {
          
       
          return MaterialApp(
            home:Scaffold(
              body:Stack(
              children:[
                
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children:
                 [Expanded(
                   flex:1
                   ,
                  child:  Slider(
                      label: 'volume',
                      activeColor: Colors.black,
                     value: volume,
                     min: 0,
                     max: 1,
                     onChanged:(v){
                       _v1.setVolume(v);
                     },
                   )),
                   Expanded(
                     flex:1,
                      child:Chewie(controller: _chewieController,)
                   ),
                   Expanded(
                     flex: 1,
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Spacer(),
                        Spacer(),
                        ],)
                )
                     ],

                     ),
              ),Draggable(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        
                        height:150,
                        width:100,
                        
                              child: CameraPreview(_controller),
                         
                      ),
                  ),
                ),
                feedback: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        
                        height:150,
                        width:100,
                        
                              child: CameraPreview(_controller),
                         
                      ),
                  ),
                ),
              ),])
                 ),);
                 
                 

                 
            
          
        }
     
      
        

  }