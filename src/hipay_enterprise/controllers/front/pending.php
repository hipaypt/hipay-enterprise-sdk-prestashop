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
class Hipay_enterprisePendingModuleFrontController extends ModuleFrontController {

    /**
     * @see FrontController::postProcess()
     */
    public function postProcess() {
        $this->display_column_left = false;
        $this->display_column_right = false;
        parent::initContent();

        $context = Context::getContext();

        
    }

}

require_once(_PS_ROOT_DIR_ . _MODULE_DIR_ . 'hipay_enterprise/lib/vendor/autoload.php');
