<?php

/**
 * 2017 HiPay
 *
 * NOTICE OF LICENSE
 *
 * @author    HiPay <support.wallet@hipay.com>
 * @copyright 2017 HiPay
 * @license   https://github.com/hipay/hipay-wallet-sdk-prestashop/blob/master/LICENSE.md
 */

require_once(dirname(__FILE__) . '/../../classes/helper/tools/hipayHelper.php');

class Hipay_enterpriseExceptionModuleFrontController extends ModuleFrontController {

    /**
     * @see FrontController::postProcess()
     */
    public function postProcess() {
        $this->display_column_left = false;
        $this->display_column_right = false;
        parent::initContent();

        $context = Context::getContext();

        if (!(bool) $this->module->hipayConfigTool->getConfigHipay()["payment"]["global"]["regenerate_cart_on_decline"]) {
            HipayHelper::unsetCart();
        }
        
        $this->setTemplate ( 'paymentReturn/exception.tpl' );
    }

}
