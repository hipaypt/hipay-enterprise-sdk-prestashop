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

class Hipay_enterprisePendingModuleFrontController extends ModuleFrontController
{
    const PATH_TEMPLATE_PS_17 = '/views/templates/front/paymentReturn/pending17.tpl';
    const PATH_TEMPLATE_PS_16 =  'paymentReturn/pending.tpl';

    /**
     * @see FrontController::postProcess()
     */
    public function postProcess()
    {
        $this->display_column_left = false;
        $this->display_column_right = false;
        parent::initContent();

        HipayHelper::unsetCart();

        $path = (_PS_VERSION_ >= '1.7' ? 'module:' . $this->module->name . self::PATH_TEMPLATE_PS_17 : self::PATH_TEMPLATE_PS_16);
        $this->module->getLogs()->logInfos("# Pending payment");
        $this->setTemplate($path);
    }
}
