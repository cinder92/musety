//
//  PXFooterViewModelHelper.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 11/15/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

internal extension PXResultViewModel {

    func getFooterComponentProps() -> PXFooterProps {
        return PXFooterProps(buttonAction: getActionButton(), linkAction: getActionLink())
    }

    func buildFooterComponent() -> PXFooterComponent {
        let footerProps = getFooterComponentProps()
        return PXFooterComponent(props: footerProps)
    }
}

// MARK: Build Helpers
internal extension PXResultViewModel {

    func getActionButton() -> PXAction? {
         var actionButton: PXAction?
        if let label = self.getButtonLabel(), let action = self.getButtonAction() {
            actionButton = PXAction(label: label, action: action)
        }
        return actionButton
    }

    func getActionLink() -> PXAction? {
        var actionLink: PXAction?
        if let labelLink = self.getLinkLabel(), let actionOfLink = self.getLinkAction() {
            actionLink = PXAction(label: labelLink, action: actionOfLink)
        }
        return actionLink
    }

    private func getButtonLabel() -> String? {
        if paymentResult.isAccepted() {
            if self.paymentResult.isWaitingForPayment() {
                if preference.getPendingSecondaryButtonText() != nil {
                    return preference.getPendingSecondaryButtonText()!
                } else {
                    return PXFooterResultConstants.DEFAULT_BUTTON_TEXT
                }
            } else if !preference.getApprovedSecondaryButtonText().isEmpty {
                return preference.getApprovedSecondaryButtonText()
            } else {
                return PXFooterResultConstants.DEFAULT_BUTTON_TEXT
            }
        } else if paymentResult.isError() {
            if let labelError = preference.getRejectedSecondaryButtonText() {
                return labelError
            } else {
                return PXFooterResultConstants.ERROR_BUTTON_TEXT.localized
            }
        } else if paymentResult.isWarning() {
            if let labelWarning = preference.getPendingSecondaryButtonText() {
                return labelWarning
            } else if self.paymentResult.statusDetail == PXRejectedStatusDetail.CALL_FOR_AUTH.rawValue || self.paymentResult.statusDetail == PXRejectedStatusDetail.INSUFFICIENT_AMOUNT.rawValue {
                return PXFooterResultConstants.C4AUTH_BUTTON_TEXT.localized
            } else if self.paymentResult.statusDetail == PXRejectedStatusDetail.CARD_DISABLE.rawValue {
                return PXFooterResultConstants.CARD_DISABLE_BUTTON_TEXT.localized
            } else {
                return PXFooterResultConstants.WARNING_BUTTON_TEXT.localized
            }
        }
        return PXFooterResultConstants.DEFAULT_BUTTON_TEXT
    }

    private func getLinkLabel() -> String? {
        if let label = preference.getExitButtonTitle() {
            return label
        }
        if paymentResult.isAccepted() {
           return PXFooterResultConstants.APPROVED_LINK_TEXT.localized_beta
        } else if paymentResult.isError() {
            return PXFooterResultConstants.ERROR_LINK_TEXT.localized
        } else if paymentResult.isWarning() {
            if self.paymentResult.statusDetail == PXRejectedStatusDetail.CALL_FOR_AUTH.rawValue || self.paymentResult.statusDetail == PXRejectedStatusDetail.INSUFFICIENT_AMOUNT.rawValue {
                return PXFooterResultConstants.ERROR_LINK_TEXT.localized
            } else {
                return PXFooterResultConstants.WARNING_LINK_TEXT.localized
            }
        }
        return PXFooterResultConstants.DEFAULT_LINK_TEXT.localized
    }

    private func getButtonAction() -> (() -> Void)? {
        return { self.pressButton() }
    }

    private func getLinkAction() -> (() -> Void)? {
        return { self.pressLink() }
    }

    private func pressButton() {
        if paymentResult.isAccepted() {
             self.callback(PaymentResult.CongratsState.approved)
        } else if paymentResult.isError() {
             self.callback(PaymentResult.CongratsState.cancel_SELECT_OTHER)
        } else if paymentResult.isWarning() {
            if self.paymentResult.statusDetail == PXRejectedStatusDetail.CALL_FOR_AUTH.rawValue || self.paymentResult.statusDetail == PXRejectedStatusDetail.INSUFFICIENT_AMOUNT.rawValue {
                self.callback(PaymentResult.CongratsState.cancel_SELECT_OTHER)
            } else {
                self.callback(PaymentResult.CongratsState.cancel_RETRY)
            }
        }
    }

    private func pressLink() {
        if paymentResult.isAccepted() {
            self.callback(PaymentResult.CongratsState.approved)
        } else if paymentResult.isError() {
            self.callback(PaymentResult.CongratsState.approved) //
        } else if paymentResult.isWarning() {
            if self.paymentResult.statusDetail == PXRejectedStatusDetail.CALL_FOR_AUTH.rawValue || self.paymentResult.statusDetail == PXRejectedStatusDetail.INSUFFICIENT_AMOUNT.rawValue {
                self.callback(PaymentResult.CongratsState.approved)
            } else {
                self.callback(PaymentResult.CongratsState.cancel_SELECT_OTHER)
            }
        }
    }
}
