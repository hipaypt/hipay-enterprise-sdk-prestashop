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
{include file="$hipay_enterprise_tpl_dir/front/partial/js.strings.tpl"}
<form id="tokenizerForm" action="{$action|escape:'html':'UTF-8'}" enctype="application/x-www-form-urlencoded"
      class="form-horizontal hipay-form-17" method="post"
      name="tokenizerForm" autocomplete="off">
    {if $confHipay.payment.global.card_token}
        {if $savedCC}
            <p><strong>{l s='Pay with a saved credit card' mod='hipay_enterprise'}</strong></p>
            <div id="error-js-oc" style="display:none" class="alert alert-danger">
                <span>There is 1 error</span>
                <ol>
                    <li class="error-oc"></li>
                </ol>
            </div>
            {foreach $savedCC as $cc}
                <div class="form-group row">
                    <div class="col-md-1 col-lg-1 col-xs-1 col-sm-1">
                        <span class="custom-radio">
                            <input type="radio" name="ccTokenHipay" value="{$cc.token|escape:'html':'UTF-8'}"/>
                            <span></span>
                        </span>
                    </div>
                    <div class="col-md-10 col-lg-10 col-xs-10 col-sm-10">
                        <div class="row">
                            <span class="hipay-img col-md-2 col-xs-3">
                                <img class="card-img" src="{$this_path_ssl|escape:'html':'UTF-8'}/views/img/{$cc.brand|lower|escape:'html':'UTF-8'}_small.png"/>
                            </span>
                            <span class="hipay-pan col-md-10 col-xs-9">{$cc.pan|escape:'html':'UTF-8'}</span>
                            <span class="hipay-exp-date col-md-10 col-xs-9">{l s='Exp. date'  mod='hipay_enterprise'}
                                : {"%02d"|sprintf:$cc.card_expiry_month}/{$cc.card_expiry_year|escape:'html':'UTF-8'}</span>
                            <span class="hipay-card-holder col-md-10 col-xs-9">{$cc.card_holder|escape:'html':'UTF-8'}</span>
                        </div>
                    </div>
                </div>
                <br/>
            {/foreach}
            <p><strong>{l s='Pay by credit card' mod='hipay_enterprise'}</strong></p>
        {/if}
    {/if}
    <div id="error-js" style="display:none" class="alert alert-danger">
        <ul>
            <li class="error"></li>
        </ul>
    </div>
    {include file="$hipay_enterprise_tpl_dir/hook/paymentForm.tpl"}
    <br/>
    {if $confHipay.payment.global.card_token && !$is_guest }
        <span class="custom-checkbox">
            <input id="saveTokenHipay" type="checkbox" name="saveTokenHipay">
            <span><i class="material-icons checkbox-checked"></i></span>
            <label>{l s='Save credit card (One click payment)' mod='hipay_enterprise'}</label>
        </span>
    {/if}
</form>
<div id="payment-loader-hp" style='text-align: center; display:none;'>
    <div><strong>{l s='Your payment is being processed. Please wait.'  mod='hipay_enterprise'}</strong></div>
    <img src="{$this_path_ssl|escape:'html':'UTF-8'}/views/img/loading.gif" alt="loading payment">
</div>

<script>
    document.addEventListener('DOMContentLoaded', setSelectedPaymentMethod, false);

    var activatedCreditCard = [];
    {foreach $activatedCreditCard as $cc}
        activatedCreditCard.push("{$cc|escape:'html':'UTF-8'}");
    {/foreach}

    var activatedCreditCardError = "{l s='This credit card type or the order currency is not supported. Please choose a other payment method.' mod='hipay_enterprise'}";
    var myPaymentMethodSelected = false;
    function setSelectedPaymentMethod() {
        $(".payment-options").change(function () {
            myPaymentMethodSelected = $(".payment-options").find("input[data-module-name='credit_card']").is(":checked");
        });
    }
    {if $confHipay.account.global.sandbox_mode}
    var api_tokenjs_mode = "stage";
    var api_tokenjs_username = "{$confHipay.account.sandbox.api_tokenjs_username_sandbox|escape:'html':'UTF-8'}";
    var api_tokenjs_password_publickey = "{$confHipay.account.sandbox.api_tokenjs_password_publickey_sandbox|escape:'html':'UTF-8'}";
    {else}
    var api_tokenjs_mode = "production";
    var api_tokenjs_username = "{$confHipay.account.production.api_tokenjs_username_production|escape:'html':'UTF-8'}";
    var api_tokenjs_password_publickey = "{$confHipay.account.production.api_tokenjs_password_publickey_production|escape:'html':'UTF-8'}";
    {/if}
</script>