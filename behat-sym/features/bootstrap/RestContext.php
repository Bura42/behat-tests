<?php

use Behat\Behat\Context\Context;
use Behat\Mink\Exception\ExpectationException;
use GuzzleHttp\Client;
use Psr\Http\Message\ResponseInterface;
use Symfony\Component\PropertyAccess\Exception\NoSuchPropertyException;
use Symfony\Component\PropertyAccess\PropertyAccess;

class RestContext implements Context
{
    use MinkContextTrait;

    /**
     * @var ResponseInterface
     */
    public $_response;

    /**
     * @var Client
     */
    public $_client;

    private $_parameters = [];

    public function __construct(array $parameters)
    {
        $this->_parameters = $parameters;
        $baseUrl = $this->getParameter('base_uri');
        $client = new Client(['base_uri' => $baseUrl]);
        $this->_client = $client;
    }

    public function getParameter(string $name)
    {
        if (count($this->_parameters) === 0) {
            throw new \Exception('Parameters not loaded!');
        } else {
            $parameters = $this->_parameters;

            return $parameters[$name] ?? null;
        }
    }

    /**
     * @When /^I request "([^"]*)"$/
     */
    public function iRequest(string $uri)
    {
        $this->_response = $this->_client->get($uri);
    }

    /**
     * @When /^I put request "([^"]*)" with '([^']*)'$/
     */
    public function iPutRequest(string $uri, string $body)
    {
        $this->_response = $this->_client->put($uri, ['body' => $body]);
    }

    /**
     * @When /^I post request "([^"]*)" with '([^']*)'$/
     */
    public function iPostRequest(string $uri, string $body)
    {
        $this->_response = $this->_client->post($uri, ['body' => $body]);
    }

    /**
     * @Then /^the response should be JSON$/
     */
    public function theResponseShouldBeJson()
    {
        $data = json_decode($this->_response->getBody());
        if (empty($data)) {
            throw new Exception("Response was not JSON\n" . $data);
        }
    }

    /**
     * @Then /^response status code should be (\d+)$/
     */
    public function theResponseStatusCodeShouldBe(int $httpStatus)
    {
        if ($this->_response->getStatusCode() !== $httpStatus) {
            throw new \Exception('HTTP code does not match ' . $httpStatus .
                ' (actual: ' . $this->_response->getStatusCode() . ')');
        }
    }

    /**
     * @Then response data params should be set to:
     */
    public function thePropertyEquals($table)
    {
        $params = json_decode($this->_response->getBody());
        $propertyAccessor = PropertyAccess::createPropertyAccessor();

        foreach ($table->getHash() as $param) {
            try {
                $value = $propertyAccessor->getValue($params, $param['parameter']);
            } catch (NoSuchPropertyException $e) {
                throw new ExpectationException(
                    sprintf("response do not contain %s parameter", $param['parameter']),
                    $this->minkContext->getSession()->getDriver()
                );
            }

            $parameterValue = $param['value'];

            if($param['value'] === 'true' || $param['value'] === 'false') {
                $parameterValue = ($param['value'] === 'true');
            }

            \PHPUnit_Framework_Assert::assertEquals(
                $parameterValue,
                $value,
                sprintf(
                    "Response parameter %s should be set to '%s' and is set to '%s'",
                    $param['parameter'],
                    $param['value'],
                    $value
                )
            );
        }
    }

    /**
     * @Then response data params should not be set to:
     */
    public function thePropertyNotEquals($table)
    {
        $params = json_decode($this->_response->getBody());
        $propertyAccessor = PropertyAccess::createPropertyAccessor();

        foreach ($table->getHash() as $param) {
            $valueExists = $propertyAccessor->isReadable($params, $param['parameter']);
            if ($valueExists) {
                try {
                    $value = $propertyAccessor->getValue($params, $param['parameter']);
                } catch (NoSuchPropertyException $e) {
                    throw new ExpectationException(
                        sprintf("response do not contain %s parameter", $param['parameter']),
                        $this->minkContext->getSession()->getDriver()
                    );
                }

                \PHPUnit_Framework_Assert::assertNotEquals(
                    $param['value'],
                    $value,
                    sprintf(
                        "Response parameter %s should not be set to '%s' and is set to '%s'",
                        $param['parameter'],
                        $param['value'],
                        $value
                    )
                );
            }
        }
    }
}
