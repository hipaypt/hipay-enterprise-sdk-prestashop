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

<div class="form-group row">
    <label class="col-md-3 form-control-label {if isset($field.required) && $field.required}required{/if}">
        {if isset($field["label"][$language])}
            {$field["label"][$language]|escape:'html':'UTF-8'}
        {else}    
            {$field["label"]["en"]|escape:'html':'UTF-8'}
        {/if}
    </label>
    <div class="col-md-9">
        <input id="{$localPaymentName|escape:'html':'UTF-8'}-{$name|escape:'html':'UTF-8'}" class="form-control input-hp" name="{$name|escape:'html':'UTF-8'}" type="text" value=""
               {if isset($field.required) && $field.required}required{/if}>
    </div>
</div>