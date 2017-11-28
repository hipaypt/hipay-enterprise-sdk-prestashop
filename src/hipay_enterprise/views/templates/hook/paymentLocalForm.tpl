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
{if !empty($methodFields)}

    {foreach $methodFields as $name => $field}

        {if $field["type"] eq "text"}
            {include file="$hipay_enterprise_tpl_dir/front/formFieldTemplate/$psVersion/inputText.tpl"}

        {else if $field["type"] eq "gender"}
            {include file="$hipay_enterprise_tpl_dir/front/formFieldTemplate/$psVersion/inputGender.tpl"}
        {/if}
        <br/>
    {/foreach}
    <input type="hidden" name="localSubmit"/>
    <script>
        (function () {
            {foreach $methodFields as $name => $field}
            {if isset($field.controlType)}
            hiPayInputControl.addInput('{$localPaymentName|escape:'html':'UTF-8'}', '{$localPaymentName|escape:'html':'UTF-8'}-{$name|escape:'html':'UTF-8'}', '{$field.controlType|escape:'html':'UTF-8'}', {if isset($field.required)}{$field.required|escape:'html':'UTF-8'}{else}false{/if});
            {/if}
            {/foreach}
        })();

    </script>
{/if}