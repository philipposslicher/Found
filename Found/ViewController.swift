import UIKit
import MapKit



class ViewController: UIViewController, MKMapViewDelegate {

    class Pin: NSObject, MKAnnotation  {
        
        let coordinate: CLLocationCoordinate2D
        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
        }
    }
    
    
    @IBAction func dropPin(sender: AnyObject) {
        let pin = Pin(coordinate: mapView.userLocation.coordinate)
        mapView.addAnnotation(pin)
    }
    @IBOutlet weak var mapView: MKMapView!
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation:
        MKUserLocation) {
            let center = CLLocationCoordinate2D(latitude:
                userLocation.coordinate.latitude,
                longitude: userLocation.coordinate.longitude)
            let width = 1000.0 // meters
            let height = 1000.0
            let region = MKCoordinateRegionMakeWithDistance(center, width,
                height)
            mapView.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.setUserTrackingMode(.Follow, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

