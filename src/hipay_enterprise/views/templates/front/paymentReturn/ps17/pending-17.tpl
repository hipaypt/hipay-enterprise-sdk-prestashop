{**
 * HiPay Enterprise SDK Prestashop
 *
 * 2017 HiPay
 *
 * NOTICE OF LICENSE
 *
 * @author    HiPay <support.tpp@hipay.com>
 * @copyright 2017 HiPay
 * @license   https://github.com/hipay/hipay-enterprise-sdk-prestashop/blob/master/LICENSE.md
 *}
{extends "$layout"}
{block name="content"}
    <h2>{l s='Payment Summary' mod='hipay_enterprise'}</h2>
    <h3>{l s='HiPay payment.' mod='hipay_enterprise'}</h3>
    <p>{l s='Your order is awaiting confirmation from the bank.' mod='hipay_enterprise'}
        <br/><br/>{l s='Once it is approved it will be available in your' mod='hipay_enterprise'} <strong><a
                    href="{$link->getPageLink('history', true)}">{l s='order history' mod='hipay_enterprise'}</a></strong>
    </p>
    <p><a href="index.php">{l s='Back to home' mod='hipay_enterprise'}</a></p>
{/block}