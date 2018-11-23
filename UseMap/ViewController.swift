//
//  ViewController.swift
//  UseMap
//
//  Created by 503-16 on 2018. 11. 22..
//  Copyright © 2018년 the. All rights reserved.
//

import UIKit

//MapKit 임포트
import MapKit

//CoreLocation 임포트
import CoreLocation

class ViewController: UIViewController {
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var mapView: MKMapView!
    
    //검색 결과를 저장할 배열 객체
    var matchingItem : [MKMapItem] = [MKMapItem]()
    
    @IBAction func zoom(_ sender: Any) {
        //맵 뷰에서 현재 사용자의 위치 가져오기
        let userLocation = mapView.userLocation
        //출력 영역 만들기
        let region = MKCoordinateRegion.init(center: userLocation.coordinate, span:MKCoordinateSpan.init(latitudeDelta: 2000, longitudeDelta: 2000))
        //맵 뷰에 설정
        mapView.setRegion(region, animated: true)
    }
    @IBAction func type(_ sender: Any) {
        if mapView.mapType == .satellite{
            mapView.mapType = .standard
        }else{
            mapView.mapType = .satellite
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //위치정보 사용 객체 생성
        locationManager = CLLocationManager()
        //위치정보 사용 권한을 묻는 대화상자 출력
        locationManager?.requestWhenInUseAuthorization()
        //맵 뷰에 현재 위치를 출력
        mapView.showsUserLocation = true
        
        mapView.delegate = self
        
        
        
        
    }
    
    func performSearch(){
        //기존 검색 내용 삭제
        matchingItems.removeAll()
        //검색 객체 만들기
        let request = MKLocalSearch.Request()
        //검색어와 검색 영역 설정
        request.naturalLanguageQuery = "커피"
        request.region = mapView.region
        //검색 요청 객체 생성
        let search = MKLocalSearch(request: request)
        //검색 요청과 핸들러
        search.start { (response, error) in
            <#code#>
        }
    }
    
    @IBAction func search(_ sender: Any) {
        
    }
    

}


extension ViewController : MKMapViewDelegate{
    //사용자의 위치가 변경된 경우 호출되는 메소드
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
}

