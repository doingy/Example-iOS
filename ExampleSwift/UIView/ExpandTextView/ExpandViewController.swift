//
//  ExpandViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/11/30.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var timerView: TimerView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        timerView.invalidateTimer()
    }

    lazy var data: [String] = {
        let data: [String] = (0...100).map { _ in
            return """
            鸡鸣外欲曙，新妇起严妆。著我绣夹裙，事事四五通。足下蹑丝履，头上玳瑁光。腰若流纨素，耳著明月珰。指如削葱根，口如含朱丹。纤纤作细步，精妙世无双。
            上堂拜阿母，阿母怒不止。“昔作女儿时，生小出野里。本自无教训，兼愧贵家子。受母钱帛多，不堪母驱使。今日还家去，念母劳家里。”却与小姑别，泪落连珠子。“新妇初来时，小姑始扶床；今日被驱遣，小姑如我长。勤心养公姥，好自相扶将。初七及下九，嬉戏莫相忘。”出门登车去，涕落百余行。
            府吏马在前，新妇车在后。隐隐何甸甸，俱会大道口。下马入车中，低头共耳语：“誓不相隔卿，且暂还家去；吾今且赴府，不久当还归。誓天不相负！”
            """
        }
        return data
    }()
}

extension ExpandViewController: UICollectionViewDelegate {
    
}

extension ExpandViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpandCell.identifier, for: indexPath) as! ExpandCell
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ExpandCell else {
            return
        }
        let data = self.data[indexPath.item]
        cell.config(data)
    }
}

extension ExpandViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.size
        return CGSize(width: size.width, height: size.height * 0.5)
    }
}
