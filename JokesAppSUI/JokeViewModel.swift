//
//  JokeViewModel.swift
//  JokesAppSUI
//
//  Created by Dilara Akdeniz on 26.07.2023.
//

//Alamofire, Swift diliyle yazılmış, iOS uygulamalarında internet üzerinden veri alışverişini (HTTP isteklerini) kolaylaştıran bir kütüphanedir. Örneğin, bir web sitesinden veri çekmek ya da sunucuya veri göndermek gibi işlemleri basit ve hızlı bir şekilde yapmanızı sağlar.

import Foundation
import Alamofire

class JokesViewModel: ObservableObject {
    
    @Published var jokes = [Value]() //JokesData'daki Value structının içerisindeki joke'a ulaşarak fıkraları alacağız
    var JSONDataLink = "https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json"
    
    func addJokes() {
        //AF Alamofire demek
        //of:Welcome.self kısmı view model içerisindeki Welcome structından veri alınacak demektir.
        AF.request(JSONDataLink, method: .get).responseDecodable(of: Welcome.self) { response in
            switch response.result {
                case .success(let data):
                    let index = Int.random(in: 0..<5)
                    let value = [data.value[index]]
                    self.jokes += value //Burada self.jokes = vaue dersek eski şakayı siler yerine yenisini koyar ama biz eskisi kalsın alta yenileri eklensin istiyoruz o yüzden += kullandık
                case .failure(let error):
                    print(error)
                
            }
        }
        
    }
}
