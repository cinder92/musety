//
//  PXPaymentMethodComponentRenderer+OneTap.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 16/5/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

extension PXPaymentMethodComponentRenderer {
    func oneTapRender(component: PXPaymentMethodComponent) -> PXOneTapPaymentMethodView {
        let arrowImage: UIImage? = ResourceManager.shared.getImage("oneTapArrow")
        var defaultHeight: CGFloat = 80
        let leftRightMargin = PXLayout.S_MARGIN
        let interMargin = PXLayout.XS_MARGIN
        let pmView = PXOneTapPaymentMethodView()
        let cftColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.3) // Not in MLUI

        // Arrow image.
        let arrowImageView = UIImageView(image: arrowImage)
        arrowImageView.contentMode = .scaleAspectFit
        pmView.addSubview(arrowImageView)
        PXLayout.setHeight(owner: arrowImageView, height: PXLayout.XS_MARGIN).isActive = true
        PXLayout.setWidth(owner: arrowImageView, width: PXLayout.XXS_MARGIN).isActive = true
        PXLayout.centerVertically(view: arrowImageView).isActive = true
        PXLayout.pinRight(view: arrowImageView, withMargin: PXLayout.S_MARGIN).isActive = true

        // PamentMethod Title.
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        pmView.paymentMethodTitle = title
        pmView.addSubview(title)
        title.attributedText = component.props.title
        title.font = Utils.getFont(size: PXLayout.XS_FONT)
        title.textColor = component.props.boldLabelColor
        title.textAlignment = .left
        title.numberOfLines = 2
        title.adjustsFontSizeToFitWidth = true
        if let pmTitle = pmView.paymentMethodTitle {
            PXLayout.pinLeft(view: pmTitle, to: pmView, withMargin: PXLayout.XXXL_MARGIN + PXLayout.L_MARGIN).isActive = true
            PXLayout.pinRight(view: pmTitle, to: arrowImageView, withMargin: PXLayout.S_MARGIN).isActive = true
        }

        // PamentMethod Icon.
        let paymentMethodIcon = component.getPaymentMethodIconComponent()
        pmView.paymentMethodIcon = paymentMethodIcon.render()
        pmView.paymentMethodIcon?.layer.cornerRadius = IMAGE_WIDTH/2
        if let pmIcon = pmView.paymentMethodIcon {
            pmView.addSubview(pmIcon)
            PXLayout.pinLeft(view: pmIcon, withMargin: leftRightMargin).isActive = true
            PXLayout.setHeight(owner: pmIcon, height: IMAGE_HEIGHT).isActive = true
            PXLayout.setWidth(owner: pmIcon, width: IMAGE_WIDTH).isActive = true
            PXLayout.pinTop(view: pmIcon, to: pmView, withMargin: PXLayout.S_MARGIN).isActive = true
        }

        // PaymentMethod Subtitle.
        if let detailText = component.props.subtitle, let pmTitle = pmView.paymentMethodTitle, let pmIcon = pmView.paymentMethodIcon {
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            pmView.addSubview(detailLabel)
            detailLabel.attributedText = detailText
            detailLabel.font = Utils.getFont(size: PXLayout.XXS_FONT)
            detailLabel.textColor = component.props.lightLabelColor
            detailLabel.textAlignment = .left
            PXLayout.setHeight(owner: detailLabel, height: PXLayout.M_FONT).isActive = true
            PXLayout.pinLeft(view: detailLabel, to: pmTitle).isActive = true
            PXLayout.pinTop(view: pmTitle, to: pmIcon).isActive = true
            PXLayout.put(view: detailLabel, onBottomOf: pmTitle, withMargin: PXLayout.XXXS_MARGIN).isActive = true
            PXLayout.pinRight(view: detailLabel, withMargin: PXLayout.M_MARGIN).isActive = true
            pmView.paymentMethodSubtitle = detailLabel
            pmTitle.layoutIfNeeded()
            defaultHeight += pmTitle.frame.height - PXLayout.XXXS_MARGIN
        } else {
            if let pmTitle = pmView.paymentMethodTitle, component.props.descriptionDetail == nil {
                PXLayout.centerVertically(view: pmTitle, to: pmView).isActive = true
            } else {
                if let pmTitle = pmView.paymentMethodTitle {
                    PXLayout.pinTop(view: pmTitle, withMargin: PXLayout.S_MARGIN).isActive = true
                }
            }
        }

        // Right label description
        if let rightAttr = component.props.descriptionTitle, let subtitleLabel = pmView.paymentMethodSubtitle {
            let rightAttrLabel = UILabel()
            rightAttrLabel.translatesAutoresizingMaskIntoConstraints = false
            pmView.addSubview(rightAttrLabel)
            rightAttrLabel.attributedText = rightAttr
            rightAttrLabel.font = Utils.getFont(size: PXLayout.XXS_FONT)
            rightAttrLabel.textColor = component.props.lightLabelColor
            rightAttrLabel.textAlignment = .left
            PXLayout.setHeight(owner: rightAttrLabel, height: PXLayout.M_FONT).isActive = true
            PXLayout.centerVertically(view: rightAttrLabel, to: subtitleLabel).isActive = true
            PXLayout.put(view: rightAttrLabel, rightOf: subtitleLabel, withMargin: PXLayout.XXS_MARGIN).isActive = true
        }

        // CFT label.
        if let cftAttr = component.props.descriptionDetail {
            let cftLabel = UILabel()
            cftLabel.translatesAutoresizingMaskIntoConstraints = false

            if let _ = pmView.paymentMethodSubtitle {
                pmView.addSubviewToBottom(cftLabel, withMargin: PXLayout.XXS_MARGIN)
            } else {
                if let title = pmView.paymentMethodTitle {
                    pmView.addSubview(cftLabel)
                    PXLayout.put(view: cftLabel, onBottomOf: title, withMargin: PXLayout.XXS_MARGIN).isActive = true
                }
            }

            cftLabel.attributedText = cftAttr
            cftLabel.font = Utils.getLightFont(size: PXLayout.M_FONT)
            cftLabel.textColor = cftColor
            cftLabel.textAlignment = .left
            PXLayout.setHeight(owner: cftLabel, height: PXLayout.M_FONT).isActive = true
            PXLayout.pinLeft(view: cftLabel, to: title, withMargin: 0).isActive = true
            defaultHeight += PXLayout.XS_MARGIN
        }

        // Bordered line color.
        pmView.layer.borderWidth = 1
        pmView.layer.borderColor = ThemeManager.shared.lightTintColor().cgColor
        pmView.layer.cornerRadius = 4
        pmView.backgroundColor = component.props.backgroundColor
        pmView.translatesAutoresizingMaskIntoConstraints = false

        pmView.pinLastSubviewToBottom(withMargin: PXLayout.S_MARGIN)?.isActive = true

        return pmView
    }
}
