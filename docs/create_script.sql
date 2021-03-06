-- MySQL Script generated by MySQL Workbench
-- Seg 12 Dez 2016 21:30:49 BRST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`editoras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`editoras` ;

CREATE TABLE IF NOT EXISTS `mydb`.`editoras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`livros` ;

CREATE TABLE IF NOT EXISTS `mydb`.`livros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `edicao` INT NOT NULL,
  `imagem` VARCHAR(200) NOT NULL,
  `resumo` TEXT NOT NULL,
  `editora_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_livros_editoras1_idx` (`editora_id` ASC),
  CONSTRAINT `fk_editora`
    FOREIGN KEY (`editora_id`)
    REFERENCES `mydb`.`editoras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`generos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`generos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`generos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`generos_livros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`generos_livros` ;

CREATE TABLE IF NOT EXISTS `mydb`.`generos_livros` (
  `genero_id` INT NOT NULL,
  `livro_id` INT NOT NULL,
  PRIMARY KEY (`genero_id`, `livro_id`),
  INDEX `fk_generos_has_livros_livros1_idx` (`livro_id` ASC),
  INDEX `fk_generos_has_livros_generos_idx` (`genero_id` ASC),
  CONSTRAINT `fk_genero`
    FOREIGN KEY (`genero_id`)
    REFERENCES `mydb`.`generos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro`
    FOREIGN KEY (`livro_id`)
    REFERENCES `mydb`.`livros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contatos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`contatos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`contatos` (
  `usuario_id` INT NOT NULL,
  `contato_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `contato_id`),
  INDEX `fk_contato_idx` (`contato_id` ASC),
  INDEX `fk_usuario_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contato`
    FOREIGN KEY (`contato_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enderecos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`enderecos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`enderecos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios_enderecos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuarios_enderecos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`usuarios_enderecos` (
  `usuario_id` INT NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `endereco_id`),
  INDEX `fk_endereco_idx` (`endereco_id` ASC),
  INDEX `fk_usuario_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `mydb`.`enderecos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefones_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefones_usuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefones_usuarios` (
  `telefone_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`telefone_id`, `usuario_id`),
  INDEX `fk_usuarios_idx` (`usuario_id` ASC),
  INDEX `fk_telefone_idx` (`telefone_id` ASC),
  CONSTRAINT `fk_telefone`
    FOREIGN KEY (`telefone_id`)
    REFERENCES `mydb`.`telefones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
