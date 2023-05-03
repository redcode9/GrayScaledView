    
// This little utility function will adds Autolayout constraints to fill `view` with `self`
// You can extends UIView class adding this

extension UIView {
        func fill(view: UIView, insets: UIEdgeInsets = .zero, useSafeArea: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        let leading = self.leadingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor, constant: insets.left)
        let bottom = self.bottomAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor, constant: -insets.bottom)
        let trailing = self.trailingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor, constant: -insets.right)
        let top = self.topAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor, constant: insets.top)
        NSLayoutConstraint.activate([leading, bottom, trailing, top])
    }
}



// With this greyscaleView we create a filter layer and cover all the content to make a greyScaledPattern
// Remember to create it as a lazy if you will reuse it in a Collection or TableView with n cells complexity and Reusables

    lazy var greyscaleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
        view.layer.compositingFilter = "hueBlendMode"
        view.isUserInteractionEnabled = false
        contentView.insertSubview(view, belowSubview: behindThisView) // to put this view behind something
        view.fill(view: self)
        return view
    }()