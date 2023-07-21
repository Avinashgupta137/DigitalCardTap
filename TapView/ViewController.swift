import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var membershipCard: UIView!
    @IBOutlet weak var CardFrontView: UIView!
    @IBOutlet weak var CardBackView: UIView!
    
    
    @IBOutlet weak var ViewRotate: UIStackView!
    
    @IBOutlet weak var rotateiamge: CustomImageView!
    
    var isFlip: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        membershipCard.addGestureRecognizer(tapGestureRecognizer)

    }

    func rotateView() {
        ViewRotate.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        rotateiamge.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
    }
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        // Perform the flip animation
        UIView.transition(with: membershipCard, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: {
            if self.isFlip {
                self.CardFrontView.isHidden = false
                self.CardBackView.isHidden = true
            } else {
                self.CardFrontView.isHidden = true
                self.CardBackView.isHidden = false
            }
        }, completion: { _ in
            // Update the flip status
            self.isFlip.toggle()

        })
    }

}

