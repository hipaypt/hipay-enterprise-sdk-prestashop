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

<label class="{if isset($field.required) && $field.required}required{/if}">
    {if isset($language) && isset($field["label"][$language])}
        {$field["label"][$language]|escape:'html':'UTF-8'}
    {else}    
        {$field["label"]["en"]|escape:'html':'UTF-8'}
    {/if}
</label>
<input id="{$localPaymentName|escape:'html':'UTF-8'}-{$name|escape:'html':'UTF-8'}"
       class="form-control {if isset($formErrors) && isset($formErrors[$name])} error-input-hp {/if}" name="{$name|escape:'html':'UTF-8'}"
       type="text" value="" {if isset($field.required) && $field.required}required{/if}>
{if isset($formErrors) && isset($formErrors[$name])}
    <p class="error-text-hp">{$formErrors[$name]|escape:'html':'UTF-8'}</p>
{/if}

