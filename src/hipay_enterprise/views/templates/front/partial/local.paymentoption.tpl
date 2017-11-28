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
<div class="row">
    <div class="col-xs-12 col-md-12">
        <form class="localpayment" method="post" action="{$paymentProduct.link|escape:'html':'UTF-8'}">
            <p class="payment_module" id="hipay_payment_button">
                <a href="javascript:void(0);" onclick="{literal}$(this).closest('form').submit();{/literal}"
                   title="{l s='Pay by ' mod='hipay_enterprise' } {$paymentProduct.displayName|escape:'html':'UTF-8'}"
                   style="padding-left: 13px;">
                    <img src="{$domain|cat:$paymentProduct.payment_button|escape:'html':'UTF-8'}"
                         style="max-width: 160px;max-height: 50px;" alt="{$paymentProduct.displayName|escape:'html':'UTF-8'}"/>
                    {l s='Pay by ' mod='hipay_enterprise' } {$paymentProduct.displayName|escape:'html':'UTF-8'}
                    <span>
                        {if $configHipay.payment.global.operating_mode != 'api'}
                            {if $configHipay.payment.global.display_hosted_page != 'iframe'}
                                <em>{l s='You will be redirected to an external payment page. Please do not refresh the page during the process' mod='hipay_enterprise'}</em>
                            {/if}
                        {/if}
                        {if isset($hipay_prod) && (!$hipay_prod)}
                            <em>{l s='(sandbox / test mode)' mod='hipay_enterprise'}</em>
                        {/if}
                    </span>
                </a>
            </p>
            <input id="ioBB_{$paymentProduct@key|escape:'html':'UTF-8'}" class="ioBB" type="hidden" name="ioBB">
        </form>
    </div>
</div>