//
//  ViewController.swift
//  googlemapstest
//
//  Created by Camron Godbout on 3/15/15.
//  Copyright (c) 2015 Camron Godbout. All rights reserved.
//

import UIKit
import CoreLocation
import MediaPlayer

class ViewController: UIViewController, GMSPanoramaViewDelegate, GMSMapViewDelegate {

    //@IBOutlet weak var mapView: GMSMapView!
    var mapView: GMSMapView!
    var segMarker: GMSMarker!
    
    var moviePlayer : MPMoviePlayerController?
    var james: UIPageViewController!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
//        var panoramaNear = CLLocationCoordinate2DMake(50.059139, -122.958391)
//        var panoramaNear = CLLocationCoordinate2DMake(33.995706, -81.033082)
//
//        
//        var panoView = GMSPanoramaView.panoramaWithFrame(CGRectZero,
//                nearCoordinate:panoramaNear)
//        // Create a marker at the Eiffel Tower
//        var position = CLLocationCoordinate2DMake(33.99531,-81.034042)
//        var marker = GMSMarker(position: position)
//        marker.title = "Text here"
//        marker.snippet = "Here is a snippet"
//        marker.infoWindowAnchor = CGPointMake(0.5, 0.5)
//        marker.icon = UIImage(named: "image.png")
//        marker.panoramaView = panoView
//        self.view = panoView
        

        
        var camera = GMSCameraPosition.cameraWithLatitude(33.993551 ,
            longitude: -81.025958, zoom: 17)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.mapView.delegate = self
        self.view = mapView
        
        
//        mapView.frame = CGRectZero
//        mapView.camera = camera

        //markers begin
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(33.995999, -81.03301)
        marker.title = "827 Assembly Street"
        marker.icon = UIImage(named: "location_house2_resize.png")
        marker.snippet = "snippet"
        marker.map = mapView
        
        var marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(33.991805, -81.039720)
        marker2.title = "Palmetto Compress Building"
        marker2.snippet = "snippet"
        marker2.icon = UIImage(named: "location_factory_resize.png")
        marker2.map = mapView
      
        var marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(33.991854, -81.031873)
        marker3.title = "Celia Dial Saxon School"
        marker3.snippet = "snippet"
        marker3.icon = UIImage(named: "location_school.png")
        marker3.map = mapView
        
        var marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2DMake(33.990795, -81.029416)
        marker4.title = "Union Train Station"
        marker4.icon = UIImage(named: "location_business.png")
        marker4.snippet = "Snippet"
        marker4.map = mapView
        
        var marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2DMake(33.993651, -81.025758)
        marker5.title = "Booker T. Washington High School"
        marker5.icon = UIImage(named: "location_school.png")
        marker5.snippet = "Snippet"
        marker5.map = mapView
        //markers end
        
        
        //mapView.touchesBegan(<#touches: NSSet#>, withEvent: <#UIEvent#>)
        
        //Add the marker to a GMSMapView object named mapView
        //marker.map = mapView
        
        
        
        //overlay code begins here
        
        var southWest = CLLocationCoordinate2DMake(33.984110, -81.038885);
        var northEast = CLLocationCoordinate2DMake(34.005605, -81.028186);
        var overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        var icon = UIImage(named: "Map without street names-01.png")
        
        var center = CLLocationCoordinate2DMake(33.99474, -81.033249)
        
        var overlay = GMSGroundOverlay(position: center, icon: icon, zoomLevel: 17)
        overlay.bearing = -20
        overlay.map = mapView
        
        //overlay code ends here
        
        
    }
    
    
    
    func mapView(mapView: GMSMapView!, markerInfoContents marker: GMSMarker!) -> UIView! {
        println(marker.title)
        if let infoView = UIView.viewFromNibName("MarkerInfoView") as? MarkerInfoView {
            infoView.nameLabel.text = marker.title
            println(marker.title + ".png")
            infoView.placePhoto.image = UIImage(named: marker.title + ".png")
            return infoView
        }
        else {
            return nil
        }
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {

      if(marker.title == "Booker T. Washington High School")
      {
        self.performSegueWithIdentifier("contentSegue", sender: self)
      }
      
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
//        if segue.identifier == "PanoSegue"
//        {
//            var destVC = segue.destinationViewController as PanoViewController
//            destVC.marker = segMarker
//        }
//        else
        if segue.identifier == "contentSegue"
        {
            var destVC = segue.destinationViewController as! PageViewController
        }
//        else if segue.identifier == "VideoSegue"
//        {
//            var destVC = segue.destinationViewController as VideoViewController
//            destVC.videoName = "sample_mpeg4" //this will obvious be changed once we get more videos
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}


//        var camera = GMSCameraPosition.cameraWithLatitude(33.995706,
//            longitude:-81.033082, zoom:17.5, bearing:30, viewingAngle:40)
//        
//        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
//        self.view = mapView
